require 'spec_helper'
require 'pry'

RSpec.describe Surveyor::Answer do
  TEST_VALUE = 3
  let(:question) { double(Surveyor::Question, title: "Sample question") }
  subject(:answer) { Surveyor::Answer.new(question: question, value: TEST_VALUE) }

  it "has a question" do
    expect(answer.question).to be(question)
  end

  it "has the correct value" do
    expect(answer.value).to eq(TEST_VALUE)
  end
end
