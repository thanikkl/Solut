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
    @new_contact_request = ContactRequest.new(contact_request_params)
    @new_contact_request.instrument = Instrument.find_by(name: params[:contact_request][:instrument_id])
    @new_contact_request.event = @event
    @new_contact_request.user = current_user
    @messages = @contact_request ? @contact_request.messages : []
    @message = Message.new
    authorize @new_contact_request
    if @new_contact_request.save
      if params[:message].present?
        Message.create(content: params[:message], user: current_user, contact_request_id: @new_contact_request.id)
      end
      # redirect_to dashboard_path
    else
      render 'events/show'
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
