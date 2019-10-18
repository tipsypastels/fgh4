class AddBannerHasTextToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :banner_has_text, :boolean
  end
end
