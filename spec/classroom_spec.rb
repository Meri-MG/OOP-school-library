require 'spec_helper'

describe Classroom do
  before :each do
    @label = Classroom.new 'Science'
  end

  describe '#new' do
    it 'takes three parameters and returns a Classroom object' do
      @label.should be_an_instance_of Classroom
    end
  end

  describe '#label' do
    it 'returns the correct label' do
      @label.label.should eql 'Science'
    end
  end
end
