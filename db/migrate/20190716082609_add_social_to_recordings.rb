class AddSocialToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :github, :string
    add_column :recordings, :pokecomm, :string
    add_column :recordings, :discord, :string
  end
end
