class CreateFloatValues < ActiveRecord::Migration[5.1]
  def change
    create_table :float_values do |t|
      t.decimal :value, precision: 36, scale: 18
      t.timestamps
    end
  end
end
