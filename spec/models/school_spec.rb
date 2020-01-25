require 'rails_helper'

RSpec.describe School, type: :model do

  describe 'attributes' do
    it 'has a name' do
      name = 'BurgerU'
      school = School.create(name: name)
      expect(school.name).to eq(name)
    end

    it 'has a address' do
      address = '123 Street BLVD'
      school = School.create(address: address)
      expect(school.address).to eq(address)
    end

    it 'has a principal' do
      principal = 'Mr. T'
      school = School.create(principal: principal)
      expect(school.principal).to eq(principal)
    end

    it 'has a capacity' do
      capacity = 150
      school = School.create(capacity: capacity)
      expect(school.capacity).to eq(capacity)
    end

    it 'is a private school' do
      private_school = true
      school = School.create(private_school: private_school)
      expect(school.private_school).to eq(private_school)
    end

    it 'is not a private school' do
      private_school = false
      school = School.create(private_school: private_school)
      expect(school.private_school).to eq(private_school)
    end
  end

  describe "vaildations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :principal }
    it { should validate_presence_of :capacity }

    it 'has a capacity lower bound' do
      should validate_numericality_of(:capacity).
      is_greater_than_or_equal_to(0)
    end

    it 'as a capcaity higer bound' do
      should validate_numericality_of(:capacity).
      is_less_than_or_equal_to(52000)
    end
  end

  describe "association" do
    it { should have_many(:students) }
    it { should have_many(:students).dependent(:destroy) }
  end

  describe "uniqueness" do
    School.create!(name: 'foo', address: '123', principal: 'mt')
    subject { School.new(name: 'foo', address: '123', principal: 'mt') }
    it { should validate_uniqueness_of(:name) }
  end

  describe "numericality" do
    before(:each) do
      @school = School.create(name: 'foo', address: '123', principal: 'mt', capacity: 15)
    end

     it { should validate_numericality_of(:capacity) }
  end
end
