class ContactRequestsController < ApplicationController
  before_action :find_event, only: [ :show, :destroy]

  def index
    @contact_requests = policy_scope(Request)
  end

  def show
    authorize @contact_request
    @event = @request.event
  end

  def new
    @contact_request = ContactRequest.new
    authorize @contact_request
  end

  def create
    @contact_request = ContactRequest.new(contact_request_params)
    @contact_request.user = current_user
    # @request.instrument =
    authorize @contact_request
    if @contact_request.save
      redirect_to contact_requests_path(@request)
    else
      render :new
    end
  end

  private

  def contact_request_params
    params.require(:contact_request).permit(:status, :instrument_id, :event_id, :user_id)
  end

  def find_contact_request
    @contact_request = ContactRequest.find(params[:id])
  end

  def find_event
    @event = @contact_request.event
  end
end