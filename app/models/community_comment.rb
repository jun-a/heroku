class CommunityComment < ActiveRecord::Base
  belongs_to :community
  belongs_to :member

  # paper_clipの設定(validationなど)について
  # attr_accessor :image_file_name, :image_content_type, :image_file_size, :image_updated_at

  has_attached_file :image,
                    styles: {medium: '640x160>'}, # size
                    url: '/system/images/community_comments/:basename.:extension', # 画像保存先のURL先
                    path: "#{Rails.root}/public/system/images/community_comments/:basename.:extension" # サーバ上の画像保存先パス

  # 拡張子のvalidationチェック
  # validates_attachment_content_type :image,  content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"], presence: true

  do_not_validate_attachment_file_type :image

end
