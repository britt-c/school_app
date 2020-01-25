class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.belongs_to :school, foreign_key: true
      t.string :name, null: false
      t.integer :student_number, null: false, default: 0
      t.float :gpa, null: false, default: 0.0

      t.timestamps
    end
  end
end
