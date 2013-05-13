# -- coding: utf-8

require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.amazon.co.jp/gp/rss/bestsellers/books/ref=zg_bs_books_rsslink"
charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end

rank = Nokogiri::HTML.parse(html, nil, charset)

# rank = Nokogiri::XML(open('http://www.amazon.co.jp/gp/rss/bestsellers/books/ref=zg_bs_books_rsslink'))
rank.css("item").each do |item|
	puts item.css("title").text
	puts item.css("pubdate").text
	puts item.css("a")[2].text + item.css("span[class = 'byLinePipe']")[0].text
	puts item.css("span[class ='price']").text
	puts ""
end
