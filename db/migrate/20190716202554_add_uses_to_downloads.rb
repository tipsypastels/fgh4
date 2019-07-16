class AddUsesToDownloads < ActiveRecord::Migration[6.0]
  def change
    add_column :downloads, :uses, :integer, default: 0
  end
end
