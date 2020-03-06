class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :nick_name, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :last_name, :first_name, :nick_name, :age, :address, :profile_picture, :genre_preferences, :description, :email, user_instruments: [], instrument_ids: [] ])
    #devise_parameter_sanitizer.permit(:account_update, keys: [ :last_name, :first_name, :nick_name, :age, :address, :profile_picture, :genre_preferences, :description, :email ])
  end

  include Pundit

  # # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end


end
