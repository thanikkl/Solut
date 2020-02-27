class EventsController < ApplicationController
  before_action :find_event, only: [ :show, :destroy]

  def index
    @genres = Event::GENRE_ARRAY
    @instruments = Event::EVENT_INSTRUMENTS_ARRAY
    @event_types = Event::TYPE_EVENT_ARRAY
    @arrondissements = (75001..75020)


    @events = policy_scope(Event)
    if params[:genre].present?
      @events = policy_scope(Event).where("genre ILIKE ?", "%#{params[:genre]}%")
    end
    if params[:instrument].present?
      @events = policy_scope(Event).where("instrument_array ILIKE ?", "%#{params[:instrument]}%")
    end
    if params[:event_type].present?
      @events = policy_scope(Event).where("event_type ILIKE ?", "%#{params[:event_type]}%")
    end
    if params[:arrondissement].present?
      @events = policy_scope(Event).where("location ILIKE ?", "%#{params[:arrondissement]}%")
    end
    return @events
  end

  # @artciles.where(name: params[:filter][:name])

  def show
    authorize @event
    @user = @event.user
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

  def edit
    authorize @event
    @event = Event.find(params[:id])
  end

  def update
    authorize @event
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to events_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
