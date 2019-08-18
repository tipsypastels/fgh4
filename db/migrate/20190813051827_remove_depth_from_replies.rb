class RemoveDepthFromReplies < ActiveRecord::Migration[6.0]
  def change

    remove_column :replies, :depth, :integer

    remove_column :replies, :replyable_type, :string

    remove_column :replies, :replyable_id, :integer
  end
end
