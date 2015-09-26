class ArticlesController < ApplicationController
  include Chatwork
  before_action :require_login!
  before_action :require_admin_login!, only: [:destroy]
  def all_index
    @articles = Article.all.shuffle
  end

  def facebook_index
  end

  def show
  end

end
