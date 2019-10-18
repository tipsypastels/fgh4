class RecordingsController < ApplicationController
  before_action :set_recording, except: %i|index new create|
  before_action :authenticate_user!, except: %i|index show|
  before_action :authenticate_published!, only: %i|show|
  before_action :authenticate_author!, only: %i|edit update destroy|

  def index
    @recordings = Recording.on_index(params)

    respond_to do |format|
      format.html {}
      # TODO MAJOR HACK
      # this is NOT json, but idk how to send type JS in axios, soooo we have this mess
      # fix it ASAP!
      format.json {
        render partial: 'list', locals: { recordings: @recordings }, formats: [:html]
      }
    end
  end

  def new
    @recording = Recording.new
  end

  def create
    @recording = Recording.create(recording_params)
    
    if @recording.persisted?
      redirect_to recording_path(@recording)
    else
      if @recording.type
        render "new_#{@recording.type.downcase}"
      else
        redirect_to root_path
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recording.update(recording_params)
      redirect_to recording_path(@recording)
    else
      render 'edit'
    end
  end

  private

  def recording_params
    params.require(:recording).permit(:name, :tag_list, :published, :type, :description, :content, :avatar, :banner, :github, :discord, :pokecomm, :relic_castle, downloads_attributes: [])
  end

  def authenticate_published!
    return if @recording.editable?
    redirect_to root_path unless @recording.published?
  end

  def authenticate_author!
    redirect_to root_path unless @recording.editable?
  end

  def set_recording
    @recording = Recording.friendly.find(params[:id])
  end
end