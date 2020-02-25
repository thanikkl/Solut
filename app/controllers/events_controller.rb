class EventsController < ApplicationController
  before_action :find_event, only: [ :show, :destroy]

  def index
    @events = policy_scope(Event)
  end

  def show
  end

  # add authorize before entry is actually committed in DB
  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    @event.user = current_user
    if @event.save
      redirect_to events_path(@event)
    else
      render :new
    end
  end


  private

  def event_params
    params.require(:event).permit(:name)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end

# t.date "date"
# t.string "location"
# t.integer "capacity"
# t.string "title"
# t.string "event_type"
# t.integer "duration"
# t.string "genre"
# t.bigint "user_id", null: false
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.index ["user_id"], name: "index_events_on_user_id"
