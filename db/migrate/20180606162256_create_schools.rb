class CreateSchools < ActiveRecord::Migration[5.1]
  def change
    create_table :schools do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.string :principal, null: false
      t.integer :capacity, null: false, default: 0
      t.boolean :private_school, null: false, default: true

      t.timestamps
    end
  end
end
