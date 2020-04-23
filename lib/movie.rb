require 'nokogiri'
require 'watir'
require 'webdrivers'

class Movie
  attr_accessor :key
  attr_writer :browser

  def initialize(key)
    key.downcase!
    @browser = Watir::Browser.new
    @browser.goto "https://globoplay.globo.com/busca/?q=#{key}".sub(' ', '+')
  end

  def parsing
    parsed = Nokogiri::HTML.parse(@browser.html)
    results = parsed.css('.tiled-grid-widget')
    creation = create_hash(results).pop
    creation
  end

  def more
    button = @browser.button(class: 'action-button__button')
    number1 = @browser.span(class: 'results-title-widget__subtitle')
    hidden_div = @browser.div(class: 'action-button--hidden')
    return false if number1.exists? == false

    while hidden_div.exists? == false
      button.click
      sleep(1)
    end
  end

  private

  def create_hash(obj)
    obj.map do |movie|
      { title: movie.css('.video-widget__title').map(&:text),
        duration: movie.css('.video-widget__duration').map(&:text),
        date: movie.css('.video-exhibited-at').map(&:text),
        link: movie.xpath("//div[@class='final-content']/a/@href").map(&:text) }
    end
  end
end
