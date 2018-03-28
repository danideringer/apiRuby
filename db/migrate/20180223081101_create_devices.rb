class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :code, null: false
      t.string :name
      t.integer :last_frame_id
      t.datetime :last_frame_at
      t.decimal :latitude, precision: 16, scale: 12
      t.decimal :longitude, precision: 16, scale: 12
      t.timestamps
    end
      add_index :devices, :code, unique: true

  end
end
