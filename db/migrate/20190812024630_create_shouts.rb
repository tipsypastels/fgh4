class CreateShouts < ActiveRecord::Migration[6.0]
  def change
    create_table :shouts do |t|
      t.integer :user_id
      t.string :text
      t.string :link
      t.datetime :shouted_at

      t.timestamps
    end
  end
end
