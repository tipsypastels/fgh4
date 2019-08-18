class AddRelicCastleToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_column :recordings, :relic_castle, :string
  end
end
