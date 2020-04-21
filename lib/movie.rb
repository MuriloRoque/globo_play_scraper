require 'nokogiri'
require 'httparty'

class Movie
  attr_reader :link

  def initialize
    @link = 'https://globoplay.globo.com/busca/?q=the+big+bang+theory'
  end

  def parsing
    unparsed = HTTParty.get(@link)
    parsed = Nokogiri::HTML(unparsed)
    parsed
  end

  def display
    results = parsing.css('.video-widget__title').text
    results
  end
end
