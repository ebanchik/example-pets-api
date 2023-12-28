class CreateNames < ActiveRecord::Migration[7.0]
  def change
    create_table :names do |t|
      t.string :age
      t.string :breed

      t.timestamps
    end
  end
end
