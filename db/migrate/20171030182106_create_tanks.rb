class CreateTanks < ActiveRecord::Migration[5.1]
  def change
    create_table :tanks do |t|
      t.text :number
      t.text :level
      t.timestamps
    end
  end
end
