require 'nokogiri'
require 'watir'
require 'webdrivers/chromedriver'

class Movie
  attr_reader :key, :browser

  def initialize(key)
    key.downcase!
    @browser = Watir::Browser.new :chrome, headless: true
    @browser.goto "https://globoplay.globo.com/busca/?q=#{key}".sub(' ', '+')
  end

  def parsing
    parsed = Nokogiri::HTML.parse(@browser.html)
    results = parsed.css('.video-widget__title').text
    results
  end
end
