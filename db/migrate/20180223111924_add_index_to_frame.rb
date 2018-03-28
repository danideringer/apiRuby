class AddIndexToFrame < ActiveRecord::Migration[5.1]
  def change
    add_index :frames, [:timestamp]
  end
end
