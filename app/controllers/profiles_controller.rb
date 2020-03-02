class ProfilesController < ApplicationController
  skip_after_action :verify_policy_scoped, only: :index

  def index
    @users = User.all
  end

  def show
    #@user = User.find(params[:id])
    @user = authorize User.find(params[:id])
  end
end
