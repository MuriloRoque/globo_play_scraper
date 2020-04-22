#!/usr/bin/env ruby
require_relative '../lib/movie.rb'
require_relative '../lib/webpage.rb'
puts 'Please type your search keywords:'
key = gets.chomp
movie = Movie.new(key)
movie.more
hash_results = movie.parsing
results = Webpage.new(key)
file_html = results.generate_page_html
file_html.puts "<!DOCTYPE html>
<html lang='en-US'>
<head>
  <meta charset='UTF-8'/>
  <link rel='stylesheet' href='styles/#{key}.css'/>
  <title>#{key} search results!</title>
</head>
<body>
  <header>
    <h1>Here are the #{hash_results[:title].length} results for your search '#{key}':</h1>
  </header>
  <main>
    <ul class = 'flex'>
      <div>
        <p class = 'elem'><b>Title</b></p>"
hash_results[:title].each do |i|
  file_html.puts "\t\t\t\t<p class = 'elem'>#{i}</p>
"
end
file_html.puts "\t\t\t</div>
      <div>
        <p class = 'elem'><b>Duration</b></p>"
hash_results[:duration].each do |i|
  file_html.puts "\t\t\t\t<p class = 'elem'>#{i}</p>
"
end
file_html.puts "\t\t\t</div>
      <div>
        <p class = 'elem'><b>Air date</b></p>"
hash_results[:date].each do |i|
  file_html.puts " \t\t\t\t<p class = 'elem'>#{i}</p>
"
end
file_html.puts "\t\t\t</div>
      <div>
        <p class = 'elem'><b>Link</b></p>"
hash_results[:link].each do |i|
  file_html.puts "\t\t\t\t<a class = 'd-block elem' href = 'https://globoplay.globo.com#{i}'>Click to watch!</a>
"
end
file_html.puts "\t\t\t</div>
    </main>
  </body>
</html>"
file_html.close
file_css = results.generate_page_css
file_css.puts 'body{background-color: #e4e4e4; width: 100%;} .flex{display:flex; justify-content: space-around;}
              .d-block{display:block;} .elem{height:20px; padding: 1px; text-align: center; margin: 16px 0;}'
file_css.close
