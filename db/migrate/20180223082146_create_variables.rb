class CreateVariables < ActiveRecord::Migration[5.1]
  def change
    create_table :variables do |t|
      t.string :code, null: false
      t.string :name
      t.string :symbol
      t.integer :value_type
      t.timestamps
    end

    add_index :variables, :code, unique: true
  end
end
