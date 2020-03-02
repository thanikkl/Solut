class MessagesController < ApplicationController

  def new
    @message = Message.new
    authorize @message
  end

  def create
    @event = Event.find(params[:message][:event])
    @contact_request = ContactRequest.find_by(user: current_user, event: @event)
    @message = Message.new(message_params)
    @message.contact_request = @contact_request
    @message.user = current_user
    authorize @message
    @message.save

    redirect_to event_path(@event)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
