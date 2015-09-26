# coding: utf-8
class Member < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # 社員確認のバリデーション
  before_save :birthday_month
  def birthday_month
    self.birthday_month =  birthday.month if self.birthday.present?
  end
  validates :email, presence: true
  validates :email, format: {with: /\b[A-Z0-9._%a-z\-]+@rejob\.co.jp\z/,
                             message: 'リジョブ発行のメールアドレスのみ登録可能です'}

  # nullのカラムがあるかのチェック
  def data_null?
    check_data =
    [
      'name',
      'image',
      'kana',
      'entry_year',
      'chatwork_id',
      'birthday',
      'profile_message',
      'hobby',
      'job',
      'departments'
    ]
    check_data.each do |get_column|
      # string型のget_columnをメソッドとして使えれば解決
      return true if self.send(get_column).blank?
    end
    false
  end

  # 検索条件について
  # 上位件数
  scope :latest_member, ->  (limit = 9) { order(created_at: :desc).limit(limit) }

  # loginしているmemberの洗い出し
  scope :login, ->  (login_member) { find_by(id: login_member.id) }

  # 直近でthankedされているメンバーの洗い出し
  scope :latest_thanked, -> (member, limit = 5) { find(member.id).thanked.order(created_at: :desc).limit(limit) }

  # テーブルの連携について
  has_many :communities
  # membersテーブルとdepartmentsテーブルをつなぐ
  has_many :members_departments
  has_many :departments, through: :members_departments

  # membersテーブルとcommunitiesテーブルをつなぐ
  has_many :members_communities
  has_many :communities, through: :members_communities

  # membersテーブルとeventsテーブルをつなぐ
  has_many :members_events
  has_many :events, through: :members_events

  # community_commentsテーブルとの連携
  has_many :community_comments
  has_many :events

  # main_departmentテーブルの連携
  belongs_to :main_department
  belongs_to :prefecture
  belongs_to :employment_status



  # memberのメッセージで使うn:n自己結合のための準備
  has_many :message_from, class_name: MemberMessage, foreign_key: :from_member_id, dependent: :destroy
  has_many :message_to,   class_name: MemberMessage, foreign_key: :to_member_id,   dependent: :destroy
  has_many :messaging, through: :message_from, source: :to_member
  has_many :messaged,  through: :message_to,   source: :from_member

  # テロップの設定
  has_many :news

  # paper_clipの設定(validationなど)について
  # attr_accessor :image_file_name, :image_content_type, :image_file_size, :image_updated_at

  has_attached_file :image,
                    styles: {medium: '640x160>'}, # size
                    url: '/system/images/members/:basename.:extension', # 画像保存先のURL先
                    path: "#{Rails.root}/public/system/images/members/:basename.:extension" # サーバ上の画像保存先パス

  # 拡張子のvalidationチェック
  # validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"], presence: true

  do_not_validate_attachment_file_type :image

  # gem deviseの設定
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :omniauthable # :validatable,

  # authの定義
  def self.find_for_google_oauth2(auth)
    member = Member.find_by(email: auth.info.email)

    unless member
      member = Member.create(name: auth.info.name,
                             provider: auth.provider,
                             uid: auth.uid,
                             email: auth.info.email,
                             token: auth.credentials.token,
                             password: Devise.friendly_token[0, 20])
    end
    member
  end



  def self.relation_members(member)
    relation_members = []
    relation_members << self.where(prefecture_id: member.prefecture_id).where.not(id: member.id).sample(1)[0] if member.prefecture_id.present?
    relation_members << self.where(main_department_id: member.main_department_id).where.not(id: member.id).sample(1)[0] if member.main_department_id.present?
    relation_members << self.where(birthday_month: member.birthday.month).where.not(id: member.id).sample(1)[0] if member.birthday_month.present?
    relation_members
  end
end
