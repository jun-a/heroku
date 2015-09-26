class CommunityCommentsController < ApplicationController
  before_action :require_login!

  def new
    @comment = CommunityComment.new
  end

  def create
    if params[:community_comment][:comment].blank?
      flash[:error] = '投稿コメントは必須です'
      redirect_to community_path(params[:community_comment][:community_id])
      return
    end
    @comment = CommunityComment.new(community_comment_params)
    @comment.member_id = current_member.id
    @comment.community_id = params[:community_comment][:community_id]
    @comment.save
    redirect_to community_path(@comment.community_id)
  end

  def destroy
  end

  private

  def community_comment_params
    params.require(:community_comment).permit(:comment, :image)
  end

end
