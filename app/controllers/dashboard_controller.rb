class DashboardController < ApplicationController
  def show
    @events = Event.where(id: current_user.contact_requests.select { |cr| cr.status == 'Accepted' }.map(&:event).map(&:id))
    @contact_requests = current_user.contact_requests
    # authorize @events
    # authorize @contact_requests
    skip_authorization
  end

  def update
    @contact_request = ContactRequest.find(params[:contact_request_id])
    @contact_request.status = params[:status]
    authorize @contact_request
    @contact_request.save!
    render partial: 'dashboard/contact_status', locals: { contact_request: @contact_request }
  end
end
