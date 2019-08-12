class RenameTextToUrlShout < ActiveRecord::Migration[6.0]
  def change
    rename_column :shouts, :text, :url
  end
end
