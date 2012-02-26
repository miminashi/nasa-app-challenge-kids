#coding:utf-8
#
# 取得したRSSから画像のURLを抜き出してみる
#
# 参考:
#   http://blog.tofu-kun.org/071212191752.php
#
require 'open-uri'
require 'rss'
require 'pp'

rss = open('http://sdo.gsfc.nasa.gov/data/aiahmi/browse/xml/aia_0193.rss') {|f| RSS::Parser.parse(f.read)}
rss.channel.items.each do |item|
  puts item.link
end
