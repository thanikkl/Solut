class MessagesController < ApplicationController

  def new
    @message = Message.new
    authorize @message
  end

  def create
    @contact_request = ContactRequest.find(params[:message][:request])
    @event = @contact_request.event
    @message = Message.new(message_params)
    @message.contact_request = @contact_request
    @message.user = current_user
    authorize @message
    @message.save

    redirect_to event_path(@event, anchor: @message.id)
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
