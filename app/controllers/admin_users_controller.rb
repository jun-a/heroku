class AdminUsersController < ApplicationController
  # before_action :require_login!
  # before_action :require_admin_login!
  http_basic_authenticate_with name: 'rejobook', password: 'adminlogin'

  def index

  end

  def member_index
    if params[:q].nil?
      @search = Member.none.search
      @results = Member.all
    else
      @search = Member.search(params[:q])
      @results = @search.result(distinct: true)
    end
  end

  def community_index
    @communities = Community.all
  end

  def message_index
    @messages = MemberMessage.all
  end

  def news_index
    @news = News.all
  end


  def member_destroy

  end

  def community_destroy

  end

  def message_destroy

  end

  def news_destroy

  end
end
