class Webpage
  attr_reader :title

  def initialize(title)
    @title = title
  end

  def generate_page_html(hash_results)
    Dir.mkdir("./results/#{@title}") unless File.exist?("./results/#{@title}")
    file_html = File.new("./results/#{@title}/#{@title}.html", 'w+')
    file_html.puts "<!DOCTYPE html>
<html lang='en-US'>
  <head>
    <meta charset='UTF-8'/>
    <link rel='stylesheet' href='styles/big_bang.css'/>
    <title>#{@title} search results!</title>
  </head>
  <body>
    <header>
      <h1>Here are the results for your search '#{@title}':</h1>

    </header>
  </body>"
    file_html.puts hash_results[:link]
    file_html.puts '</body></html>'
    file_html.close
  end

  def generate_page_css
    Dir.mkdir("./results/#{@title}/styles") unless File.exist?("./results/#{@title}/styles")
    file_css = File.new("./results/#{@title}/styles/#{@title}.css", 'w+')
    file_css.puts 'body {background-color: green; width: 100%}'
    file_css.close
  end
end
