# コミュニティの自動削除
module CommunityNilCheck
  Community.all.each do |community|
    if MembersCommunity.where(community_id: community.id).count == 0
      community.destroy
    end
  end
end
