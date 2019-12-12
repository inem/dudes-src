require 'fast'

module Dudes
  class Calculator
    using(Module.new do
      refine Astrolabe::Node do
        def fast(path)
          Fast.search(path, self)
        end

        # Lot of chunks of code parsed as (:foo, ...) if it is a single statement,
        # or (:begin, (:foo, ...), (:bar, ...)) if it is several independent statements.
        # Robustly make it an array of nodes
        def arrayify
          type == :begin ? children : [self]
        end
      end
    end)

    def initialize(code)
      @ast = Fast.ast(code)
    end

    def call
      @ast.arrayify.map(&method(:calc_class)).compact
    end

    private

    def calc_class(node)
      return unless node.type == :class

      name, parent, body = *node
      {
        name: name.children.compact.join(':'),
        methods: body&.arrayify&.map(&method(:calc_method))&.compact || [],
        references: extract_references(body)
      }
    end

    def extract_references(node)
      return [] unless node

      node.fast('(const {nil _} )').map { |n| n.children.compact.join('::') }.sort.uniq
    end

    def calc_method(node)
      return unless node.type == :def

      name, args, body = *node
      {
        name: name,
        args: args.children.count,
        length: count_statements(body.arrayify),
        conditions: count_conditions(body),
      }
    end

    # FIXME: This is kinda naive... But maybe appropriate enough
    def count_statements(nodes)
      nodes.sum { |n| n.each_node.count }
    end

    def count_conditions(node)
      node.fast('({if case} _)').count
    end
  end
end