class CreateRecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :recordings do |t|
      t.string :name
      t.integer :user_id
      t.string :type

      t.timestamps
    end
  end
end
