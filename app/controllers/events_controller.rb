class EventsController < ApplicationController
  include Chatwork
  before_action :require_login!
  before_action :require_admin_login!, only: [:destroy]
=begin
after_action :reset_session_count!
after_action :reset_home_session, only: [:index]
=end

  def index
    @events = Event.available.page(params[:page])
  end

  def show
    @event = Event.find(params[:id])
    if  @event.members.exists?(current_member)
      @join_member = current_member
    else
      @join_member = nil
    end
  end


  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      # 34886078は全体のルームid
      Chatwork.post_chatwork('34203917', @event)
      redirect_to event_path(@event)
    else
      flash[:error] = '未入力の項目があります'
      redirect_to new_event_path
    end
  end

  def edit
    @event =  Event.find(params[:id])

    unless @event.member_id == current_member.id || current_member.admin?
      flash[:error] = 'イベント作成者ではないため、編集できません'
      redirect_to events_path
    end

  end

  def update
    @event = Event.find(params[:id])
    @event.update_attributes(event_params)
    redirect_to event_path(@event)
  end

  def destroy
    Event.find(params[:id]).destroy
    redirect_to events_path
  end

  def add_member
    join_event = params[:event][:event_id]
    add_member = params[:event][:add_member_id]

    @find_event = MembersEvent.where(event_id: join_event)
    if @find_event.where(member_id: add_member).present?
      MembersEvent.where(event_id: join_event, member_id: add_member).destroy_all
    else
      MembersEvent.create(event_id: join_event, member_id: add_member)
    end
    redirect_to event_path(join_event)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :event_day, :image, :event_id, :community_id, :member_id, member_ids: [])
  end

  def reset_session_count!
    reset_count(Event)
  end

end
