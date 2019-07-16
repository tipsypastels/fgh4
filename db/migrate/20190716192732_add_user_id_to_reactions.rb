class AddUserIdToReactions < ActiveRecord::Migration[6.0]
  def change
    add_column :reactions, :user_id, :integer
  end
end
