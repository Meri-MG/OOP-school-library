require 'spec_helper'

describe Teacher do
  before :each do
    @teacher = Teacher.new '34', 'Science', 'Bob'
  end

  describe '#new' do
    it 'takes three parameters and returns a Teacher object' do
      @teacher.should be_an_instance_of Teacher
    end
  end

  it 'should inherit behavior from Parent' do
    expect(Teacher.superclass).to eq(Person)
  end

  it 'returns use services' do
    expect(@teacher.can_use_services).to eq true
  end
end
