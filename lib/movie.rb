require 'nokogiri'
require 'httparty'

class Movie
  attr_reader :link

  def initialize
    @link = 'https://www.whats-on-netflix.com/originals/'
  end

  def parsing
    unparsed = HTTParty.get(@url)
    parsed = Nokogiri::HTML(unparsed)
  end
end
