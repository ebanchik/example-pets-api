class FixAgeName < ActiveRecord::Migration[7.0]
  def change
    rename_column :pets, :ag, :age
  end
end
