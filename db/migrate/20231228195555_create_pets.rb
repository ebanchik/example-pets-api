class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :ag
      t.string :breed

      t.timestamps
    end
  end
end