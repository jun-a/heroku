require 'open-uri'
require 'rubygems'
require 'nokogiri'
require 'bundler'

Bundler.require
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
  article.save

  count = 1

  # タイトル部分
  faura_heads = doc.css('.item_heading') # [1].children.inner_text

  faura_heads.each do |head|
    item = Item.new
    item.article_id = article.id
    item.body =	head.children.inner_text
    item.sortkey = count
    item.save
    count += 1
  end

  # テキスト部分
  faura_texts = doc.css('.item_text') # [1].children.inner_text

  faura_texts.each do |text|
    item = Item.new
    item.article_id = article.id
    item.body = text.children.inner_text
    item.sortkey = count
    item.save
    count += 1
  end

  # 画像取得部分
  faura_images = doc.css('.lightbox') # [1].attributes['href'].value

  faura_images.each do |image|
    item = Item.new
    item.article_id = article.id
    get_image_url = image.attributes['href'].value
    item.get_image(get_image_url)
    item.sortkey = count
    item.save
    count += 1
  end


end

p 'urlを入力してください'
URL = gets.chomp
get_site_status(URL)
