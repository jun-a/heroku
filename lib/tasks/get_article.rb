require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'bundler'

Bundler.require
include Chatwork
# 必要なgem
# gem 'twitter'
# gem 'pry'

# The Twitter gem won't take StringIO so don't allow downloaded files to be created as StringIO. Force a tempfile to be created.
OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0


def get_site_status(url)

  html = open(url) { |f| f.read }

  doc = Nokogiri::HTML.parse(html, nil)

  # メタタグで入力する
  article =	Article.new
  article.title = doc.css("meta[property='og:title']").first.attributes['content'].value
  article.description = doc.css("meta[property='og:description']").first.attributes['content'].value
  image_url = doc.css("meta[property='og:image']").first.attributes['content'].value
  article.get_image(image_url)
  article.url = url
  article.save
  Chatwork.post_chatwork('34203917', article)
end

urls =
[
  'http://relax-job.com/faura/articles/ctDvSawq',
  'http://relax-job.com/faura/articles/d2gaM7Va',
  'http://relax-job.com/faura/articles/ghVdHJLS',
  'https://rejob.co.jp/topics/20150825904',
  'https://rejob.co.jp/topics/20150622688',
  'https://rejob.co.jp/topics/20150507466'
]

urls.length.times do |number|
  URL = urls[number]
  get_site_status(URL)
end
