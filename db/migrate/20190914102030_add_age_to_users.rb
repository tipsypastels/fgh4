class AddAgeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :age, :number
    add_column :users, :location, :string
    add_column :users, :gender, :number
  end
end
