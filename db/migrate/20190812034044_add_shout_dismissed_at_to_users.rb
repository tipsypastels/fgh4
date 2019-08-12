class AddShoutDismissedAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :shout_dismissed_at, :datetime
  end
end
