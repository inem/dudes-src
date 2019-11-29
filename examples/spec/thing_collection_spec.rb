require 'rspec'
require_relative '../lib/thing'
require_relative '../lib/thing_collection'
require 'pry'

describe 'ThingCollection' do
  let(:collection) { ThingCollection.from_dir("#{__dir__}/fixtures") }

  describe '#all_types' do
    it 'returns type - Обувь' do
      expect(collection.all_types).to eq ['Обувь', 'Верхняя одежда']
    end
  end

  describe '#one_type_things' do
    it 'returns array things by type - Обувь' do
      expect(collection.one_type_things('Обувь')).to eq [collection.things.first]
    end
  end

  describe '#one_thing_by_type' do
    it 'returns one thing by type' do
      expect(collection.one_thing_by_type(-10, 'Обувь')).to eq [collection.things.first]
    end
  end

  describe '#weather_clothing' do
    it 'returns things for -10C' do
      expect(collection.weather_clothing(-10)).to eq collection.things
    end
  end

  describe '#message' do
    it 'returns message success' do
      expect(collection.message(-10)).to eq 'Предлагаем сегодня надеть:'
    end

    it 'returns message not have things' do
      expect(collection.message(+30)).to eq 'К сожалению, нет одежды'\
                                                  ' для такой погоды.'
    end
  end
end