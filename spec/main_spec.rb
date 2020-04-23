require 'nokogiri'
require 'watir'
require 'webdrivers'
require './lib/movie.rb'
require './lib/webpage.rb'
describe Movie do
  movie = Movie.new('O bom doutor')
  movie_no_res = Movie.new('fffdfafas')
  describe '#initialize' do
    it 'returns error if no argument is given' do
      expect { Movie.new }.to raise_error(ArgumentError)
    end
    it 'returns error if argument is not a String' do
      expect { Movie.new(1) }.to raise_error(NoMethodError)
    end
  end
  # describe '#parsing' do
  #   it 'returns error if argument is given' do
  #     expect { movie.parsing(1) }.to raise_error(ArgumentError)
  #   end
  #   it 'returns error if operated on an object different than Movie' do
  #     expect { 2.parsing(1) }.to raise_error(NoMethodError)
  #   end
  #   it 'returns a hash if the given key is valid' do
  #     expect(movie.parsing).to be_a_kind_of(Hash)
  #   end
  #   it 'returns nil if the given key is not valid' do
  #     expect(movie_no_res.parsing).to be_nil
  #   end
  # end
  # describe '#more' do
  #   it 'returns error if argument is given' do
  #     expect { movie.more(1) }.to raise_error(ArgumentError)
  #   end
  #   it 'returns error if operated on an object different than Movie' do
  #     expect { 2.more(1) }.to raise_error(NoMethodError)
  #   end
  #   it 'returns nil if the given key is valid' do
  #     expect(movie.more).to be_nil
  #   end
  #   it 'returns false if the given key is not valid' do
  #     expect(movie_no_res.more).to be false
  #   end
  # end
  describe '#create_hash' do
    it 'returns error if no argument is given' do
      expect { movie.send(:create_hash) }.to raise_error(ArgumentError)
    end
  end
end
