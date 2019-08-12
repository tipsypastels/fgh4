class ShoutsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_shout, only: %i|edit update destroy bump|
  before_action :authenticate_shouter!, only: %i|edit update destroy bump|
  before_action :ensure_available, only: %i|new create|

  def dismiss
    Current.user.update!(shout_dismissed_at: Time.current)
  end

  def new
    @shout = Shout.new
  end

  def create
    if Shout.create(shout_params)
      redirect_to shouts_path
    else
      render 'edit'
    end
  end

  def edit
  end

  def update
    if @shout.update(shout_params)
      redirect_to shouts_path
    else
      render 'edit'
    end
  end

  def bump
    @shout.bump!
    redirect_to shouts_path
  end

  def destroy
    @shout.destroy
    redirect_to shouts_path
  end

  private

  def set_shout
    @shout = Shout.find(params[:id])
  end

  def authenticate_shouter!
    unless @shout.user == Current.user
      redirect_to root_path
    end
  end

  def ensure_available
    redirect_to shouts_path unless Shout.available?
  end

  def shout_params
    params.require(:shout).permit(:content, :url)
  end
end