class Student < ApplicationRecord
  validates :name, :student_number, :gpa, presence: true
  validates :name, uniqueness: true
  validates :student_number, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10000}

  belongs_to :school
end
