#!/usr/bin/env ruby
require_relative '../lib/movie.rb'
require_relative '../lib/webpage.rb'
movie = Movie.new('The Big Bang Theory')
movie.more
results = Webpage.new('The Big Bang Theory')
results.generate_page_html(movie.parsing)
results.generate_page_css
