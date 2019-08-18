class AddRecordingIdToReplies < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :recording_id, :integer
  end
end
