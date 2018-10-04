require 'spec_helper'
RSpec.describe Surveyor::FreeTextQuestion do
  QUESTION_TITLE = "Hello World".freeze
  subject { described_class.new(title: QUESTION_TITLE) }

  it 'has a title' do
    expect(subject.title).to eq(QUESTION_TITLE)
  end

  context 'valid_answer?' do
    it 'is valid when it is a String' do
      expect(subject.valid_answer?('Hello World')).to eq(true)
    end

    it 'rejects an extremely long answer' do
      excessivley_long_answer = "T" * 600_000
      expect(subject.valid_answer?(excessivley_long_answer)).to eq(false)
    end

    it 'is invalid when it is not a String' do
      expect(subject.valid_answer?(1)).to eq(false)
    end
  end
end
