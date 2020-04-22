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

  def more
    button = @browser.button(class: 'action-button__button')
    hidden_div = @browser.div(class: 'action-button--hidden')
    no_results = @browser.div(class: 'search-results-widget__no-results')
    while hidden_div.exists? == false
      break if no_results.exists?
      button.click
      sleep(2)
    end
  end
end
