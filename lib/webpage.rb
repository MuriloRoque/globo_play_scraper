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
    <link rel='stylesheet' href='styles/#{title}.css'/>
    <title>#{@title} search results!</title>
  </head>
  <body>
    <header>
      <h1>Here are the results for your search '#{@title}':</h1>
    </header>
    <main>
      <ul class = 'flex'>
        <div>
        <p class = 'elem'><b>Title</b></p>"
    hash_results[:title].each do |i|
      file_html.puts "<p class = 'elem'>#{i}</p>
    "
    end
    file_html.puts "</div>
        <div>
        <p class = 'elem'><b>Duration</b></p>"
    hash_results[:duration].each do |i|
      file_html.puts "<p class = 'elem'>#{i}</p>
    "
    end
    file_html.puts "</div>
        <div>
        <p class = 'elem'><b>Air date</b></p>"
    hash_results[:date].each do |i|
      file_html.puts "<p class = 'elem'>#{i}</p>
    "
    end
    file_html.puts "</div>
        <div>
        <p class = 'elem'><b>Link</b></p>"
    hash_results[:link].each do |i|
      file_html.puts "<a class = 'd-block elem' href = 'https://globoplay.globo.com#{i}'>Click to watch!</a>
    "
    end
    file_html.puts "</div>
    "
    file_html.puts "</main>
  </body>
  </html>"
    file_html.close
  end

  def generate_page_css
    Dir.mkdir("./results/#{@title}/styles") unless File.exist?("./results/#{@title}/styles")
    file_css = File.new("./results/#{@title}/styles/#{@title}.css", 'w+')
    file_css.puts 'body{background-color: #e4e4e4; width: 100%;} .flex{display:flex; justify-content: space-around;} .d-block{display:block;} .elem{height:20px; padding: 1px; text-align: center; margin: 16px 0;}'
    file_css.close
  end
end
