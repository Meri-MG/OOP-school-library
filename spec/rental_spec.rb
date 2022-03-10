require 'spec_helper'

describe Rental do
  before :each do
    @rental = Rental.new '10/03/2022', 'Bob', 'Sidhardha'
  end

  describe '#new' do
    it 'takes three parameters and returns a Rental object' do
      @rental.should be_an_instance_of Rental
    end
  end

  describe '#date' do
    it 'returns the correct date' do
      @rental.date.should eql '10/03/2022'
    end
  end
  describe '#person' do
    it 'returns the correct person' do
      expect(@rental.person).to be_kind_of String
    end
  end

  describe '#book' do
    it 'returns the correct book' do
      expect(@rental.book).to eq 'Sidhardha'
    end
  end
end
