class CreateJoinTableDevicesVariables < ActiveRecord::Migration[5.1]
  def change
    create_join_table :devices, :variables do |t|
      t.index [:device_id, :variable_id]
      t.index [:variable_id, :device_id]
    end
  end
end
