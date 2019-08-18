class AddRepliesCountToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :replies_count, :integer
  end
end
