class Community < ActiveRecord::Base
  # 検索条件について
  scope :latest_community, ->  (limit = 5) { order(created_at: :desc).limit(limit) }

  # 自分が所属しているコミュニティの情報
  scope :my_communities, -> (login) { where(member_id: login.id) }

  has_many :community_comments
  belongs_to :member

  # communitiesテーブルとmembersテーブルをつなぐ
  has_many :members_communities
  has_many :members, through: :members_communities



  # communityのvalidation
  # attr_accessor :image_file_name, :image_content_type, :image_file_size, :image_updated_at

  validates :name, presence: true
  validates :description, presence: true

  has_attached_file :image,
                    styles: {medium: '640x160>'}, # size
                    url: '/system/images/communities/:basename.:extension', # 画像保存先のURL先
                    path: "#{Rails.root}/public/system/images/communities/:basename.:extension" # サーバ上の画像保存先パス


  # 拡張子のvalidationチェック
  # validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"], presence: true

  do_not_validate_attachment_file_type :image

  def shuffle_community(member_ids)
    Communiy.create


  end

end
