# -- coding: utf-8

require 'open-uri'
require "rubygems"
require 'Nokogiri'

"http://www.amazon.co.jp/gp/feature.html/ref=br_lf_m_3077680066_pglink_prev?ie=UTF8&docId=3077680066&plgroup=1&plpage=1"

"http://www.amazon.co.jp/gp/feature.html/ref=br_lf_m_3077680066_pglink_2?ie=UTF8&docId=3077680066&plgroup=1&plpage=2"

url = "http://www.amazon.co.jp/gp/feature.html/ref=br_lf_m_3077680066_pglink_1?ie=UTF8&docId=3077680066&plgroup=1&plpage=1"
charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end

doc = Nokogiri::HTML.parse(html, nil, charset)



doc.css("div[class = 'content'] table tr")[1].css("td[valign = 'top']").each do |node|

	# 本のタイトル
	puts node.css("a")[0].text
	# レビュー（星の数）

	if node.css("span[class = 'asinReviewsSummary']").empty?
		puts 'レビューなし'
	else
		puts node.css("span[class = 'asinReviewsSummary']>a>img")[0].attribute('title')

	end

	# レビューの数
	if node.css("span[class = 'crAvgStars'] a").empty?
	else
		puts node.css("a")[2].text
	end
	# 価格
	puts node.css("td[class = 'productLabel']>b").text + node.css("b[class = 'price']").text
	#URL
	puts ''
	puts "URL  " + node.css("a")[0]['href']

	puts ''
	puts ''

end






