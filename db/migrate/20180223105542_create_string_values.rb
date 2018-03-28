class CreateStringValues < ActiveRecord::Migration[5.1]
  def change
    create_table :string_values do |t|
      t.string :value, limit: 4096
      t.timestamps
    end
  end
end
