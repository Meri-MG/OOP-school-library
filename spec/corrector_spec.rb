require 'spec_helper'

describe Corrector do
  context 'When testing the Corrector class' do
    it 'should trim the word with more than 10 characters' do
      corr = Corrector.new
      word = corr.correct_name('verylongword')
      expect(word).to eq 'Verylongwo'
    end
  end
end
