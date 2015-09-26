class MembersController < ApplicationController
  include Chatwork

  before_action :require_admin_login!, only: [:destroy]
  before_action :require_login!
  after_action :reset_session_count!
  after_action :reset_home_session, only: [:index]

  def index
    if params[:q].nil?
      @search = Member.none.search
      @results = Member.all.page(params[:page])
    else
      @search = Member.search(params[:q])
      @results = @search.result(distinct: true).page(params[:page])
    end

  end


  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      # 34886078は全体へのroom_id
      Chatwork.post_chatwork('34886078', @member)
    else
      redirect_to new_member_path
    end
    redirect_to member_path(@member.id)
  end

  def show
    @member = Member.find(params[:id])
    @member_messages = MemberMessage.where(to_member_id: params[:id])
    @message = MemberMessage.new
    @relation_members = Member.relation_members(@member)
  end

  def edit
    @member = Member.find(params[:id])

    unless @member.id == current_member.id || current_member.admin?
      redirect_to members_path
    end

  end


  def update
    @member = Member.find(params[:id])

    if @member.update(member_params)
      redirect_to @member
    else
      redirect_to edit_member_path(@member)
    end
  end

  def destroy
    Member.find(params[:id]).destroy
    redirect_to members_path
  end


  private

  def member_params
    params.require(:member).permit(:name, :email, :entry_year, :prefecture_id, :employment_status_id,
                                   :birthday, :chatwork_id, :indoor_call, :kana, :password, :main_department_id,
                                   :profile_message, :image, :hobby, :job, department_ids: [], communities_ids: [])
  end

  def reset_session_count!
    reset_count(Member)
  end

end
