class RejobookNewsController < ApplicationController
  before_action :require_login!
  after_action :reset_session_count!
  after_action :reset_home_session, only: [:index]


  def new
    @rejobook_news = News.new
  end

  def create
    @rejobook_news = News.new(news_params)
    @rejobook_news.member_id = params[:news][:member_id]
    if @rejobook_news.save
      redirect_to news_path(@rejobook_news.id)
    else
      flash[:error] = '未入力の項目があります'
      redirect_to new_news_path
    end
  end

  def show
    @news = News.find(params[:id])
    news_date = @news.end_date.to_s
    @news_comment = NewsComment.where(news_id: params[:id])
    if news_date.to_datetime.nil?
      @rejobook_news = @news
    elsif news_date.to_datetime >= Time.zone.today
      @rejobook_news = @news
    else
      flash[:notice] = 'this news is end publish...'
      redirect_to news_index_path
    end
  end

  def index
    @rejobook_news = News.available.page(params[:page]).per(40)
  end

  def edit
    @rejobook_news =  News.find(params[:id])
    unless @rejobook_news.member_id == current_member.id
      redirect_to news_index_path
    end

  end

  def update
    @rejobook_news =  News.find(params[:id])
    @rejobook_news.update_attributes(news_params)
    redirect_to news_path(@rejobook_news.id)
  end

  def create_news_comment
    @news_comment = NewsComment.new
    @news_comment.member_id = current_member.id
    @news_comment.news_id = params[:news_id]
    @news_comment.comment = params[:comment]
    if NewsComment.where(news_id: params[:news_id]).present?
      last_comment_id = NewsComment.where(news_id: params[:news_id]).last.news_comment_id
      @news_comment.news_comment_id = last_comment_id + 1
    else
      @news_comment.news_comment_id = 1
    end
    if @news_comment.save
      redirect_to news_path(@news_comment.news_id)
    else
      flash[:error] = '返信内容を記入してください'
      redirect_to news_path(params[:news_id])
    end
  end

  def delete_comment
    NewsComment.find_by(id: params[:comment_id], news_id: params[:news_id]).destroy
    redirect_to news_path(params[:news_id])
  end

  private

  def news_params
    params.require(:news).permit(:title, :content, :end_date, :member_id, :department_id)
  end

  def reset_session_count!
    reset_count(News)
  end
end
