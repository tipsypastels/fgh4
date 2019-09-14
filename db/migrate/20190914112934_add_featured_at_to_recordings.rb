class AddFeaturedAtToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :featured_at, :timestamp
  end
end
