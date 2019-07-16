class AddUrlToDownloads < ActiveRecord::Migration[6.0]
  def change
    add_column :downloads, :url, :string
  end
end
