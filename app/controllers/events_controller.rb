class EventsController < ApplicationController
  before_action :find_event, only: [ :show, :destroy]

  def index
    @events = policy_scope(Event)
  end

  def show
    authorize @event
  end

  # add authorize before entry is actually committed in DB
  def create
  end


  private

  def event_params
    params.require(:event).permit(:name)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
