class Thing
  attr_reader :name, :type, :temp_range

  def self.from_file(file_path)
    lines = File.readlines(file_path, chomp: true)
    new(name: lines[0],
        type: lines[1],
        temp_range: lines[2])
  end

  def initialize(params)
    @name = params[:name]
    @type = params[:type]
    @temp_range = calc_temp_range(params[:temp_range])
  end

  def calc_temp_range(string)
    range = string.delete('( )').split(',').map(&:to_i)
    range[0]..range[1]
  end

  def weather_proof?(temp)
    @temp_range.include?(temp)
  end

  def to_s
    "#{@name} (#{@type}) #{@temp_range}"
  end
end
