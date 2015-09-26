class MembersCommunity < ActiveRecord::Base

  # login_member join this community?
  scope :check_community_member, -> (community_id, login_member_id) { where(community_id: community_id, member_id: login_member_id) }

  # 個人のコミュニティへの参加機能
  def add_member(community_id, add_member_id)
    find_community =  MembersCommunity.where(community_id: community_id)
    if find_community.include?(member_id: add_member_id) # tureとfalseで処理を変える
      #=> ture
      MembersCommunity.where(community_id: community_id, member_id: add_member_id).destroy_all
    else
      #=> false
      MembersCommunity.create(community_id: community_id, member_id: add_member_id)
    end
  end


  belongs_to :community
  belongs_to :member
end
