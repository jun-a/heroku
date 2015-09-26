class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  include AdminUserLoginsHelper
  include MembersHelper
  include SessionHelper



  # 例外処理
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  # rescue_from Exception, with: :render_500


  def render_404
    render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
  end

  def render500
    render file: Rails.root.join('public/500.html'), status: 500, layout: false, content_type: 'text/html'
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    if current_member.present? && current_member.sign_in_count == 1
      initialize_count
      tutorial_home_path
    else
      top_page_home_path
    end
  end
  # before_action :home_session_check!

  private

  def require_login!
    if current_member.nil?
      redirect_to new_member_session_path
      return
    end
  end


end
