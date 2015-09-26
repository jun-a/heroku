class MainDepartment < ActiveRecord::Base
  # memberテーブルとの連携
  has_many :members
end
