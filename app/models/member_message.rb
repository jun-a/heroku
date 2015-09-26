class MemberMessage < ActiveRecord::Base
  # n:nの自己結合のための準備
  belongs_to :from_member, class_name: Member, foreign_key: :from_member_id
  belongs_to :to_member, class_name: Member,   foreign_key: :to_member_id

  belongs_to :message_icon
end
