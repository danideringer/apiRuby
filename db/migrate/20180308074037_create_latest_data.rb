class CreateLatestData < ActiveRecord::Migration[5.1]
  def change
    create_table :latest_data do |t|
      t.references :device, null: false, foreign_key: true
      t.references :variable, null: false, foreign_key: true
      t.string :value
      t.datetime :timestamp

      t.timestamps
    end
    add_index :latest_data, [:device_id, :variable_id], unique: true
  end
end
