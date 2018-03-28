class AddValueToData < ActiveRecord::Migration[5.1]
  def change
    add_reference :data, :value, polymorphic: true, index: true
  end
end
