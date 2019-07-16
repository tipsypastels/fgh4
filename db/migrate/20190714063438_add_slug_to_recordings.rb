class AddSlugToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :slug, :string
    add_index :recordings, :slug, unique: true
  end
end
