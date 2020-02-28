class UserInstrumentsController < ApplicationController

# TODO - Create to add to complete the form of edit profile
  # def create
  #   @user_instrument = UserInstrument.new(user_instrument_params)
  #   authorize @user_instrument
  #   @user_instrument.user = current_user
  #   if @user_instrument.save
  #     redirect_to events_path(@user_instrument)
  #   else
  #     render :new
  #   end
  # end

  def show
    authorize @user_instrument
    @user = @user_instrument.user
  end

# TODO - Valid the ipdate
  # def update
  #   authorize @user_instrument
  #   @user_instrument = UserInstrument.find(params[:id])
  #   @user_instrument.update(user_instrument_params)
  #   redirect_to users_edit_path(@user_instrument)
  # end

  private

  def user_instrument_params
    params.require(:user_instrument).permit(:proficiency, :instrument_id)
  end
end
