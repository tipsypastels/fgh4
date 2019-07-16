class CreateReactions < ActiveRecord::Migration[6.0]
  def change
    create_table :reactions do |t|
      t.string :reactable_type
      t.integer :reactable_id
      t.integer :emoji

      t.timestamps
    end
  end
end
