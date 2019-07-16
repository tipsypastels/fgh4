class AddNameToDownloads < ActiveRecord::Migration[6.0]
  def change
    add_column :downloads, :name, :string
  end
end
