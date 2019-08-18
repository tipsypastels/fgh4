class CcDefault0 < ActiveRecord::Migration[6.0]
  def change
    change_column_default :recordings, :replies_count, 0
  end
end
