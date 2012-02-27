#coding:utf-8
#
# 取得したRSSから画像のURLを抜き出して、URLの画像を保存する
#
# 参考:
#   http://blog.tofu-kun.org/071212191752.php
#
require 'open-uri'
require 'rss'
require 'pp'

threads = []
rss = open('http://sdo.gsfc.nasa.gov/data/aiahmi/browse/xml/aia_0193.rss') {|f| RSS::Parser.parse(f.read)}
rss.channel.items.each do |item|
  url = item.link
  threads << Thread.new(url) do |url|
    filename = File.basename(URI.parse(url).path)
    puts "saving #{url}"
    open(url) do |data|
      File.open('images/' + filename, 'wb') do |f|
        f.write(data.read)
      end
    end
  end
end
threads.each{|t| t.join}

