class AddColorToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :color, :string
  end
end
