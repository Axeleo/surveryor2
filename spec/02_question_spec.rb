require 'spec_helper'

RSpec.describe Surveyor::Question do
  QUESTION_TITLE = "Hello world".freeze
  subject { described_class.new(title: QUESTION_TITLE) }

  it "has a title" do
    expect(subject.title).to eq(QUESTION_TITLE)
  end

  context "unhappy paths" do
    it "raises an error when calling valid_answer? on base question class" do
      expect { subject.valid_answer?("test") }.to raise_error RuntimeError
    end
  end
end
