require 'spec_helper'

describe Person do
  before :each do
    @student = Person.new '17'
  end

  describe '#new' do
    it 'takes three parameters and returns a Person object' do
      @student.should be_an_instance_of Person
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      @student.age.should eql '17'
    end
  end

  describe '#age' do
    it 'checks if age is less than 18' do
      expect(@student.age).to be <= '18'
    end
  end

  
end
