class ChangeTankLevelIntToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :tanks, :level, :decimal
  end
end
