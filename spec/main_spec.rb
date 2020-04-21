require './lib/movie.rb'
describe Movie do
  movie = Movie.new
  describe '#parsing' do
    it 'returns error if argument is given' do
      expect { movie.parsing(1) }.to raise_error(ArgumentError)
    end
  end
end