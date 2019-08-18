class AddDepthToReplies < ActiveRecord::Migration[6.0]
  def change
    add_column :replies, :depth, :integer
  end
end
