class EventsController < ApplicationController
  before_action :find_event, only: [ :show, :destroy]

  def index
    @genres = ["All"] + Event::GENRE_ARRAY
    @instruments = ["All"] + Event::EVENT_INSTRUMENTS_ARRAY
    @event_types = ["All"] + Event::TYPE_EVENT_ARRAY
    @arrondissements = ["All"] + (75001..75020).map { |i| i.to_s }

    @events = policy_scope(Event)

    if params[:genre].present? && params[:genre] != "All"
      @events = @events.where("genre ILIKE ?", "%#{params[:genre]}%")
    end
    if params[:event_type].present? && params[:event_type] != "All"
      @events = @events.where("event_type ILIKE ?", "%#{params[:event_type]}%")
    end
    if params[:arrondissement].present? && params[:arrondissement] != "All"
      @events = @events.where("location ILIKE ?", "%#{params[:arrondissement]}%")
    end
    if params[:instrument].present? && params[:instrument] != "All"
      @events = @events.select do |event|
        event.instruments_array.include?(params[:instrument])
      end
      # @events.map(&:id) #=> [1, 12, 14, 25, .....]
      @events = Event.all.where(id: @events.map(&:id))

    end
  end

  def show
    authorize @event
    @user = @event.user
    @new_contact_request = ContactRequest.new

    @message = Message.new

    @contact_requests = @event.contact_requests
    unless @contact_requests.empty?
      @last_message = @contact_requests.map { |request| request.messages }.flatten.sort_by(&:created_at).last
    end
    @contact_request_accepted = @contact_requests.select { |s| s.status == "Accepted" }
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    authorize @event
    @event.user = current_user

    if @event.save
      @contact_request = ContactRequest.create(user: current_user, event: @event, instrument: Instrument.find_by(name: params[:my_instrument][:choice]), status: 'Accepted')

      redirect_to event_path(@event)
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
    params.require(:event).permit(:title, :location, :event_type, :genre, instruments_array: [])
  end

  def find_event
    @event = Event.find(params[:id])
  end
end
