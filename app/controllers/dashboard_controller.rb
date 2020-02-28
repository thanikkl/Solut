class DashboardController < ApplicationController
  def show
    @events = current_user.events
    pp @events
    @contact_requests = current_user.contact_requests
    authorize @events
    authorize @contact_requests
  end
end
