# coding: utf-8
module Chatwork
  require 'net/http'
  require 'uri'

  def self.post_chatwork(room_id, object)
    token = 'eebd0d1afed1dad2598770040630851f'

    room_id = room_id.to_s unless room_id == String


    url = 'https://api.chatwork.com/v1/rooms/' + room_id + '/messages'
    uri = URI.parse(url)

    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true

    # eventの特定
    case object.class.name
    when 'Member'
      event = '新メンバー'
      send_object = object.name
    when 'Community'
      event = '新コミュニティ'
      send_object = object.name
    when 'Event'
      event = '新イベント'
      send_object = object.name
    when 'Article'
      event = '[To:1368696][新着情報]'
      send_object = object.title
    else
      event = ''
      send_object = ''
    end

    request = Net::HTTP::Post.new(uri.request_uri)
    request['X-ChatWorkToken'] = token
    request.body = 'body=' + event + send_object + 'が作成されました'

    p https.request(request)

  end

  def self.contact_chatwork(room_id, name, contact, member_id)
    token = 'eebd0d1afed1dad2598770040630851f'

    room_id = room_id.to_s unless room_id == String


    url = 'https://api.chatwork.com/v1/rooms/' + room_id + '/messages'
    uri = URI.parse(url)

    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true


    request = Net::HTTP::Post.new(uri.request_uri)
    request['X-ChatWorkToken'] = token
    request.body = 'body=' + 'メンバー番号' + member_id + 'の' + name + 'からのお問い合わせです。' + "\n" + '[お問い合わせ内容]' + contact

    p https.request(request)

  end
=begin
  def get_chatwork
    token = 'eebd0d1afed1dad2598770040630851f'



    url = 'https://api.chatwork.com/v1/contacts/'
    uri = URI.parse(url)

    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true


    request = Net::HTTP::Get.new(uri.request_uri)
    request['X-ChatWorkToken'] = token

    p request
    p https.request(request)

  end
=end
end
