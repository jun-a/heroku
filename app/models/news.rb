class News < ActiveRecord::Base
  # テロップの設定
  belongs_to :member
  belongs_to :department
  has_many :news_comments
  validates :title, presence: true


  # 掲載可能な記事の検索
  scope :available, -> { where('end_date >= ? OR end_date IS NULL', Time.zone.today) }
end
