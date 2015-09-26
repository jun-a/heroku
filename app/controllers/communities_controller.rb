class CommunitiesController < ApplicationController
  include Chatwork
  before_action :require_login!
  before_action :require_admin_login!, only: [:destroy]
  after_action :reset_session_count!
  after_action :reset_home_session, only: [:index]

  def index
    @communities = Community.all.page(params[:page])
  end

  def show
    @community = Community.find(params[:id])
    @comment = CommunityComment.new

    if  @community.members.exists?(current_member)
      @join_member = current_member
    else
      @join_member = nil
    end
  end


  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    @community.member_id = current_member.id
    if @community.save
      # 34886078は全体のルームid
      Chatwork.post_chatwork('34203917', @community)
      redirect_to community_path(@community)
    else
      flash[:error] = '未入力の項目があります'
      redirect_to new_community_path
    end
  end

  def edit
    @community =  Community.find(params[:id])

    unless @community.member_id == current_member.id || current_member.admin?
      flash[:error] = 'コミュニティ管理者でないため編集できません'
      redirect_to communities_path
    end

  end

  def update
    @community = Community.find(params[:id])
    @community.update_attributes(community_params)
    redirect_to community_path(@community)
  end

  def destroy
    Community.find(params[:id]).destroy
    redirect_to communities_path
  end

  def add_member
    join_community = params[:community][:community_id]
    add_member = params[:community][:add_member_id]

    @find_community = MembersCommunity.where(community_id: join_community)
    if @find_community.where(member_id: add_member).present?
      MembersCommunity.where(community_id: join_community, member_id: add_member).destroy_all
    else
      MembersCommunity.create(community_id: join_community, member_id: add_member)
    end
    redirect_to community_path(join_community)
  end

  def set_shuffle
  end

  def shuffle_community
    # member_ids = params
    @community = Community.new
    @community.name = params[:name]
    @community.description = params[:name]
    @community.member_id = current_member.id
    if @community.save
      Chatwork.post_chatwork('34203917', @community)
      # ここに検索の条件ありなしのif分
      numbers = params[:numbers].to_i
      member_ids = Member.pluck(:id).sample(numbers)
      member_ids.size.times do |number|
        member_communiy = MembersCommunity.new
        member_communiy.community_id = @community.id
        member_communiy.member_id = member_ids[number]
        member_communiy.save
      end
      redirect_to community_path(@community.id)
    else
      flash[:error] = 'have error'
      redirect_to communities_path
    end
  end

  private

  def community_params
    params.require(:community).permit(:name, :description, :image, member_ids: [])
  end

  def reset_session_count!
    reset_count(Community)
  end
end
