class Webpage
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def generate_page_html
    Dir.mkdir("./results/#{@title}") unless File.exist?("./results/#{@title}")
    file_html = File.new("./results/#{@title}/#{@title}.html", 'w+')
    file_html
  end

  def generate_page_css
    Dir.mkdir("./results/#{@title}/styles") unless File.exist?("./results/#{@title}/styles")
    file_css = File.new("./results/#{@title}/styles/#{@title}.css", 'w+')
    file_css
  end
end
