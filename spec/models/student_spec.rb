require 'rails_helper'

RSpec.describe Student, type: :model do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :student_number }
    it { should validate_presence_of :gpa }

    it 'has a student_number lower bound' do
      should validate_numericality_of(:student_number).
        is_greater_than_or_equal_to(0)
    end

    it 'has a student_number higher bound' do
      should validate_numericality_of(:student_number).
        is_less_than_or_equal_to(10000)
    end
  end

  describe 'association' do
    it { should belong_to(:school) }
  end

end
