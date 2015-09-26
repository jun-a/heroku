class ContactsController < ApplicationController
  include Chatwork

  def contact
    params[:contact] = {}
    @contact = params[:contact]
  end

  def post_contact
    # team_chatへpost
    Chatwork.contact_chatwork('34203917', params['name'], params['contact'], params['member_id'])
    redirect_to top_page_home_path
  end
end
