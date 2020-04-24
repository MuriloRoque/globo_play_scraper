#!/usr/bin/env ruby
require_relative '../lib/movie.rb'
require_relative '../lib/webpage.rb'
puts 'Please type your search keywords (>= 3 characters):'
key = gets.chomp
until key.length >= 3
  puts 'Please type your search keywords (>= 3 characters):'
  key = gets.chomp
end
movie = Movie.new(key)
movie.more?
if movie.more? == false
  puts 'No results!'
else
  hash_results = movie.parsing
  results = Webpage.new(key)
  file_html = results.generate_page_html
  file_html.puts "<!DOCTYPE html>
  <html lang='en-US'>
  <head>
  \t<meta charset='UTF-8'/>
  \t<link rel='stylesheet' href='styles/#{key}.css'/>
  \t<title>#{key} search results!</title>
  </head>
  <body>
  \t<header>
  \t\t<h1>Here are the #{hash_results[:title].length} results for your search '#{key}':</h1>
  \t</header>
  \t<main>
  \t\t<ul class = 'flex'>
  \t\t\t<div>
  \t\t\t\t<p class = 'elem'><b>Title</b></p>"
  hash_results[:title].each do |i|
    file_html.puts "\t\t\t\t\t<p class = 'elem'>#{i}</p>\n"
  end
  file_html.puts "\t\t\t\t</div>
  \t\t\t<div>
  \t\t\t\t<p class = 'elem'><b>Duration</b></p>"
  hash_results[:duration].each do |i|
    file_html.puts "\t\t\t\t\t<p class = 'elem'>#{i}</p>\n"
  end
  file_html.puts "\t\t\t\t</div>
  \t\t\t<div>
  \t\t\t\t<p class = 'elem'><b>Air date</b></p>"
  hash_results[:date].each do |i|
    file_html.puts " \t\t\t\t\t<p class = 'elem'>#{i}</p>\n"
  end
  file_html.puts "\t\t\t\t</div>
  \t\t\t<div>
  \t\t\t\t<p class = 'elem'><b>Link</b></p>"
  hash_results[:link].each do |i|
    file_html.puts "\t\t\t\t\t<a class = 'd-block elem' href = 'https://globoplay.globo.com#{i}'>Click to watch!</a>\n"
  end
  file_html.puts "\t\t\t\t</div>
  \t\t</main>
  \t</body>
  </html>"
  file_html.close
  file_css = results.generate_page_css
  file_css.puts 'body{background-color: #e4e4e4; width: 100%;} .flex{display:flex; justify-content: space-around;}
                .d-block{display:block;} .elem{height:20px; padding: 1px; text-align: center; margin: 16px 0;}'
  file_css.close
  puts "Please check the 'results' directory in the root of this project, open the .html file with a browser!"
end
