class MemberMessagesController < ApplicationController
  before_action :require_login!
  after_action :reset_session_count!
  after_action :reset_home_session, only: [:index]

  def new
    @message = MemmberMessage.new
  end

  def create
    @message = MemberMessage.new(member_message_params)

    if current_member.present? && params[:member_message][:id].present?
      @message.from_member_id = current_member.id
      @message.to_member_id = params[:member_message][:id]
      if @message.save
        redirect_to member_path(params[:member_message][:id])
      else
        redirect_to member_path(current_member.id)
      end
    else
      redirect_to new_member_session_path
    end

  end

  def destroy
  end

  private

  def member_message_params
    params.require(:member_message).permit(:message, :message_icon_id, :from_member_id, :to_member_id)
  end

  def reset_session_count!
    reset_count(MemberMessage)
  end
end
