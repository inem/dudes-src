require 'rspec'
require_relative '../lib/thing'

describe 'Thing' do
  let(:thing) { Thing.new(name: 'Сапоги', type: 'Обувь', temp_range: '(-20, +5)') }
  describe '#new' do
    it 'returns name' do
      expect(thing.name).to eq 'Сапоги'
    end

    it 'returns type' do
      expect(thing.type).to eq 'Обувь'
    end

    it 'returns temp_range' do
      expect(thing.temp_range).to eq -20..5
    end
  end

  describe '#calc_temp_range' do
    it 'returns range from string' do
      expect(thing.calc_temp_range('(-50, +50)')).to eq -50..50
    end
  end

  describe '#weather_proof?' do
    it 'returns true' do
      expect(thing.weather_proof?(-10)).to eq true
    end

    it 'returns false' do
      expect(thing.weather_proof?(10)).to eq false
    end

  end

  describe '#to_s' do
    it 'returns string' do
      expect(thing.to_s).to eq 'Сапоги (Обувь) -20..5'
    end

  end

  describe '#from_file' do
    it 'return new object' do
      expect(Thing.from_file("#{__dir__}/fixtures/01.txt")).is_a? Class
    end

  end
end