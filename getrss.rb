#coding:utf-8
#
# RSSを取得してみる
#
# 参考:
#   http://blog.tofu-kun.org/071212191752.php
#
require 'open-uri'
require 'rss'
require 'pp'

rss = open('http://sdo.gsfc.nasa.gov/data/aiahmi/browse/xml/aia_0193.rss') {|f| RSS::Parser.parse(f.read)}
pp rss

