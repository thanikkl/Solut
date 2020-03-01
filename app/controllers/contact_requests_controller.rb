class ContactRequestsController < ApplicationController
  # before_action :find_event, only: [ :show, :destroy]
  before_action :set_contact_request, only: [ :new, :create]

  def index
    @contact_requests = policy_scope(Request)
  end

  def show
    authorize @contact_request
    @event = @contact_request.event
  end

  def new
    @contact_request = ContactRequest.new
    authorize @contact_request
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)
    @contact_request.instrument = Instrument.find_by(name: params[:contact_request][:instrument_id])
    @contact_request.event = @event
    @contact_request.user = current_user
    # @request.instrument =
    authorize @contact_request
    if @contact_request.save
      redirect_to events_path
    else
      render :new
    end
  end

  def update
    @contact_request.event = @event
    @contact_request.update(contact_request_params)
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:status, :instrument_id)
  end

  def set_contact_request
    @event = Event.find params[:event_id]
  end

  def find_contact_request
    @contact_request = ContactRequest.find(params[:id])
  end

  # def find_event
  #   @event = @contact_request.event
  # end
end
