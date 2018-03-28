class CreateData < ActiveRecord::Migration[5.1]
  def change
    create_table :data do |t|
      t.datetime :timestamp
      t.timestamps
    end
  end
end
