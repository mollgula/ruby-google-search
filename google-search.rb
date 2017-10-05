# -*- coding: utf-8 -*-
require 'nokogiri'
require 'open-uri'
require 'uri'
require 'cgi'

escaped_url = URI.escape("http://www.google.com/search?q=#{ARGV[0]}+#{ARGV[1]}+#{ARGV[2]}+#{ARGV[3]}+#{ARGV[4]}+#{ARGV[5]}+#{ARGV[6]}+#{ARGV[7]}+#{ARGV[8]}
  +#{ARGV[9]}+#{ARGV[10]}+#{ARGV[11]}+#{ARGV[12]}+#{ARGV[13]}+#{ARGV[14]}+#{ARGV[15]}+#{ARGV[16]}+#{ARGV[17]}+#{ARGV[18]}+#{ARGV[19]}+#{ARGV[20]}+#{ARGV[21]}
  +#{ARGV[22]}+#{ARGV[23]}+#{ARGV[24]}+#{ARGV[25]}+#{ARGV[26]}+#{ARGV[27]}+#{ARGV[28]}+#{ARGV[29]}+#{ARGV[30]}&oe=utf-8&h1=ja")
doc = Nokogiri::HTML(open(escaped_url))

puts doc.xpath("//*[@id=resultStats]/text()")

doc.xpath('//h3/a').each do |link|
  puts CGI.parse(link[:href])["aburl"]
  puts link.content
end
