class Article < ActiveRecord::Base
  has_many :items

  has_attached_file :image,
                    styles: {medium: '640x160>'}, # size
                    url: '/system/images/items/:basename.:extension', # 画像保存先のURL先
                    path: "#{Rails.root}/public/system/images/items/:basename.:extension" # サーバ上の画像保存先パス
  do_not_validate_attachment_file_type :image

  def get_image(url)
    self.image = open(url)
  end

end
