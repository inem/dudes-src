class ThingCollection
  attr_reader :things

  def self.from_dir(data_path)
    things = Dir["#{data_path}/*.txt"].map do |file_path|
      Thing.from_file(file_path)
    end
    new(things)
  end

  def initialize(things)
    @things = things
  end

  def all_types
    @things.map(&:type).uniq
  end

  def one_type_things(type)
    @things.select { |item| item.type == type }
  end

  def one_thing_by_type(temp, type)
    one_type_things(type).select { |item| item.weather_proof?(temp) }
  end

  def weather_clothing(temp)
    all_types.map { |type| one_thing_by_type(temp, type).sample }.compact
  end

  def message(temp)
    if weather_clothing(temp).any?
      'Предлагаем сегодня надеть:'
    else
      'К сожалению, нет одежды для такой погоды.'
    end
  end

  def empty_method; end
end
