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
  describe '#parsing' do
    it 'returns error if argument is given' do
      expect { movie.parsing(1) }.to raise_error(ArgumentError)
    end
    it 'returns a hash if the given key is valid' do
      expect(movie.parsing).to be_a_kind_of(Hash)
    end
    it 'returns nil if the given key is not valid' do
      expect(movie_no_res.parsing).to be_nil
    end
  end
  describe '#more' do
    it 'returns error if argument is given' do
      expect { movie.more(1) }.to raise_error(ArgumentError)
    end
    it 'returns nil if the given key is valid' do
      expect(movie.more).to be_nil
    end
    it 'returns false if the given key is not valid' do
      expect(movie_no_res.more).to be false
    end
  end
end

describe Webpage do
  webpage = Webpage.new('O bom doutor')
  describe '#initialize' do
    it 'returns error if no argument is given' do
      expect { Webpage.new }.to raise_error(ArgumentError)
    end
  end
  describe '#generate_page_html' do
    it 'returns error if argument is given' do
      expect { webpage.generate_page_html(1) }.to raise_error(ArgumentError)
    end
    it 'returns a file type object' do
      expect(webpage.generate_page_html).to be_a_kind_of(File)
    end
  end
end
