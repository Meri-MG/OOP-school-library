require 'spec_helper'

describe Student do
  before :each do
    @student = Student.new 'Science', '18'
  end

  describe '#new' do
    it 'takes three parameters and returns a Student object' do
      @student.should be_an_instance_of Student
    end
  end

  describe '#classroom' do
    it 'returns the correct classroom' do
      @student.classroom.should eql 'Science'
    end
  end

  it 'should inherit behavior from Parent' do
    expect(Student.superclass).to eq(Person)
  end

  it 'returns length of classroom' do
    @student.classroom.length.should == 7
  end

  it 'returns play hookey' do
    expect(@student.play_hookey).to be_falsey
  end
end
