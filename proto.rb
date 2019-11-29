$LOAD_PATH.unshift 'lib'
require 'dudes'

code = <<~RUBY
class A
  def m(a1, a2)
    String.new
  end
end

class B
end
RUBY

# code = File.read('examples/lib/thing.rb')
code = File.read('examples/lib/thing_collection.rb')

pp Dudes::Calculator.new(code).call