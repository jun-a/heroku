class MembersDepartment < ActiveRecord::Base
  belongs_to :department
  belongs_to :member
end
