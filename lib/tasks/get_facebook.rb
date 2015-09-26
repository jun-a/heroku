require 'open-uri'

# TODO: 長続きするTOKENの発行
ACCESS_TOKEN = 'CAACEdEose0cBANHmN5AHiNMirmubZB6OTxBqicuPeKTr8xBACC6JUMzputh1iuv5DflCbKHEh86neKvPGO33vYj8haDJYYIKIO6I3kPN2d4wNOZBwkHNTgh5lZBCuSUXw0FWMHuOuN7JY7c9pXs6nN0bQ6AUIFDcRrCmSW98IRK9NAC3FwG7IhRKhUJULcXnSVMYFOhhgZDZD'
access_token = ACCESS_TOKEN
graph = Koala::Facebook::API.new(access_token)

# 過去1件の投稿 limit: 1
groups = graph.get_connection('665356530266982', 'feed',                       fields: ['message', 'id', 'type', 'likes', 'picture', 'link'])


groups.each do |group|
  if  group['message'].present? && group['link'].present?
    get_image_url = group['picture']
    p get_image_url
    article = Article.new
    p message = group['message']
    message_length = message.size
    p article.description = group['message']
    p article.title =  message.slice!(11..message_length).to_s + '...'
    article.url = group['link']
    article.get_image(get_image_url) if group['picture'].present?
    article.save
  end
end
