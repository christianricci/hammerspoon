#!/usr/bin/env ruby -wUW1

# gem install tty-table
require 'rubygems'
require 'nokogiri'
require 'pry-byebug'
require 'tty-table'

# ruby -r pry <file.rb> <args>
# binding.pry

webserver=""
cookie="full-path-to-cookie"
search_input = ARGV.join('+')
search_url = "https://#{webserver}/secure/QuickSearch.jspa?searchString=#{search_input}"
command = "curl --insecure --silent -L --cookie #{cookie} --cookie-jar #{cookie} #{search_url} -o search.html"

system("#{command}")

page = Nokogiri::HTML(open("search.html"))

# page.css('#content > div.navigator-container > div.navigator-body > div > div > div > div > div > div > div').at('ol').children[0].attributes['data-key'].value
# => "BLA-3932"
# [37] pry(main)> page.css('#content > div.navigator-container > div.navigator-body > div > div > div > div > div > div > div').at('ol').children[0].attributes['title'].value
# => "aurora_oom_response not supported in engine version 1.17.8"

# binding.pry

table = TTY::Table.new header: ['Jira', 'Title']

# full xpath # /html/body/div/div[2]/div[1]/main/div/div[2]/div/div/div/div[1]/div[1]/div[2]/ol/li[1]/a/span[1]            
# binding.pry
# list = page.css('#content > div.navigator-container > div.navigator-body > div > div > div > div > div > div > div').at('ol').children
list = page.css('html body div div div main div div div div div div div div').at('ol').children

puts 'search url: ' + search_url
puts 'search count: ' + list.to_a.count.to_s

list.to_a.each do |el|
  table << [ 'https://rds-jira.amazon.com/browse/' + el.attributes['data-key'].value, el.attributes['title'].value.to_s[0..100] ]
end

puts table.render(:unicode, multiline: true, width: 160, resize: true)

