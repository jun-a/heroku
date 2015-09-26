# coding: utf-8
class ChatsController < ApplicationController
  before_action :require_login!

  def index
    @member_messages = MemberMessage.all.order('created_at DESC')
  end

  def chat_create
    chat = MemberMessage.new(chat_params)

    if current_member.present? && params[:member_message][:id].present?
      chat.from_member_id = current_member.id
      chat.to_member_id = params[:member_message][:id]
      if chat.save
        redirect_to chats_index_path
      else
        flash[:notice] = 'not saved !'
        redirect_to chats_index_path
      end
    else
      flash[:notice] = 'member blank !'
      redirect_to my_page_home_path
    end
  end

  def to_message
    @message = MemberMessage.new
    @member = Member.find_by(id: params[:format])
  end

  private

  def chat_params
    params.require(:member_message).permit(:message, :message_icon_id, :from_member_id, :to_member_id)
  end

end
