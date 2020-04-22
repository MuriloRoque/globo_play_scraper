require 'nokogiri'
require 'watir'
require 'webdrivers/chromedriver'
require './lib/movie.rb'
describe Movie do
  movie = Movie.new('O bom doutor')
  inv_movie = Movie.new('fffdfafas')
  describe '#initialize' do
    it 'returns error if no argument is given' do
      expect { Movie.new }.to raise_error(ArgumentError)
    end
  end
  describe '#parsing' do
    it 'returns error if argument is given' do
      expect { movie.parsing(1) }.to raise_error(ArgumentError)
    end
    it 'returns error if operated on an object different than Movie' do
      expect { 2.parsing(1) }.to raise_error(NoMethodError)
    end
    it 'returns a string if the given key is valid' do
      expect(movie.parsing).to be_a_kind_of(String)
    end
    it 'returns nil if the given key is not valid' do
      expect(inv_movie.parsing).to be_empty
    end
  end
  describe '#more' do
    it 'returns error if argument is given' do
      expect { movie.more(1) }.to raise_error(ArgumentError)
    end
    it 'returns error if operated on an object different than Movie' do
      expect { 2.more(1) }.to raise_error(NoMethodError)
    end
    it 'returns false if the given key is valid' do
      expect(movie.more).to be_nil
    end
    it 'returns nil if the given key is not valid' do
      expect(inv_movie.more).to be_nil
    end
  end
end
