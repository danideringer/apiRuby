class AddDeviceIdAndVariableIdToData < ActiveRecord::Migration[5.1]
  def change
    # add_reference add reference of relationship 1:N in model with relation 1
    add_reference :data, :device, foreign_key: true
    add_reference :data, :variable, foreign_key: true
    add_reference :data, :frame, foreign_key: true

    add_index :data, [:device_id, :variable_id, :timestamp], unique: true
  end
end
