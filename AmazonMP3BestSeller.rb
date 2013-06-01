# -- coding: utf-8

require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.amazon.co.jp/gp/bestsellers/dmusic/digital-music-track/ref=zg_all?pf_rd_p=108138409&pf_rd_s=center-2&pf_rd_t=2101&pf_rd_i=dmusic&pf_rd_m=AN1VRQENFRJN5&pf_rd_r=0KPEE48HE0PYPP1Y98ZH#1"
charset = nil
html = open(url) do |f|
  charset = f.charset
  f.read
end

rank = Nokogiri::HTML.parse(html, nil, charset)

item = rank.css("div[class = 'zg_itemRightDiv_normal']")
puts item.class

item.each do |music|
	puts music.css("span[class = 'zg_rankNumber']").text + music.css("div[class = 'zg_title']").text
	puts music.css("div[class = 'zg_byline']>a").text
	puts music.css("p[class = 'priceBlock']").text

	puts ""
end


