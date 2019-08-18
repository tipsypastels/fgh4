class RepliesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recording, only: %i|show create|
  before_action :set_reply, only: %i|update delete|

  def show
    @replies = @recording.replies.roots.includes(:author)
  end

  def create
    @reply = @recording.replies.create!(reply_params)
  end

  private

  def set_recording
    @recording = Recording.friendly.find(params[:id])
  end

  def set_reply
    @reply = Reply.find(params[:scope]) if params[:scope]
  end

  def reply_params
    params.require(:reply).permit(:content, :type, :parent_id)
  end
end