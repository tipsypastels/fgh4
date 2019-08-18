class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.integer :replyable_id
      t.string :replyable_type
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
