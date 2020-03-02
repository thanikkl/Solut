class ProfilesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index
  #skip_after_action :verify_policy_scoped, only: :show

  def index
    @users = User.all
  end

  def show
    #@user = User.find(params[:id])
    @user = User.find(params[:id])
  end
end
