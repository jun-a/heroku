class HomeController < ApplicationController
  before_action :require_login!, except: [:welcome]
  after_action :sign_in_count!, only: [:tutorial]
  before_action :null_check!, only: [:top_page]
  before_action :nil_session?, only: [:top_page]
  before_action :set_count_session, only: [:top_page]
  before_action :home_session_check!, only: [:top_page]
  after_action :null_check_blank!, only: [:top_page]


  def index
    @members = Member.latest_member
    @communities = Community.latest_community
    if params[:q].nil?
      @search = Member.none.search
      @results = {}
    else
      @search = Member.search(params[:q])
      @results = @search.result(distinct: true)
    end
    if Community.count > 3
      @random_communities = Community.find(Community.pluck(:id).sample(3))
    else
      @random_communities = Community.all
    end
    if MemberMessage.count > 11
      @member_messages = MemberMessage.find(MemberMessage.pluck(:id).sample(10))
    else
      @member_messages = MemberMessage.find(MemberMessage.pluck(:id).sample(MemberMessage.count))
    end
    @rejobook_news = News.available
  end

  def welcome
  end

  def sample
    @rejobook_news = News.available
    if params[:q].nil?
      @search = Member.none.search
      @results = {}
    else
      @search = Member.search(params[:q])
      @results = @search.result(distinct: true)
    end
  end

  def top_page
    @rejobook_news = News.available
    if params[:q].nil?
      @search = Member.none.search
      @results = {}
    else
      @search = Member.search(params[:q])
      @results = @search.result(distinct: true)
    end
  end

  def contact_list
    if params[:q].nil?
      @search = Member.all.search
      @results = Member.all.page(params[:page]).per(40)
    else
      @search = Member.search(params[:q])
      @results = @search.result(distinct: true).page(params[:page]).per(40)
    end
  end

  def tutorial
  end

  private

  def null_check!
    flash[:error] = '入力されていないデータがあります' if current_member.data_null?
  end

  def null_check_blank!
    flash[:error] = nil
  end

  def sign_in_count!
    if current_member.sign_in_count <= 1
      current_member.sign_in_count += 1
      current_member.save
    end
  end
end
