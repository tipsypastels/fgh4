class AddPublishedAtToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :published_at, :datetime
  end
end
