class Department < ActiveRecord::Base
  # departmentsテーブルとmembersテーブルをつなぐ
  has_many :members_departments
  has_many :members, through: :members_departments

  # テロップの設定
  has_many :news
end
