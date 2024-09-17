class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, only: [:show]

  def index
    # Code for index action
  end

  def show
    if current_user != @user
      redirect_to root_path, notice: "You don't have permission to see this profile"
    else
      @pins = @user.pins
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
