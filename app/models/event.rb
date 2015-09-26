class Event < ActiveRecord::Base
  belongs_to :community
  belongs_to :member
  # membersテーブルとeventsテーブルをつなぐ
  has_many :members_events
  has_many :members, through: :members_events


  has_attached_file :image,
                    styles: {medium: '640x160>'}, # size
                    url: '/system/images/members/:basename.:extension', # 画像保存先のURL先
                    path: "#{Rails.root}/public/system/images/members/:basename.:extension" # サーバ上の画像保存先パス

  scope :available, -> { where('event_day >= ? OR event_day IS NULL', Time.zone.today).order('event_day desc') }

end
