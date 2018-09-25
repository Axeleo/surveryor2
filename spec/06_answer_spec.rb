require 'spec_helper'
require 'pry'

RSpec.describe Surveyor::Answer do
  let(:question) { double(Surveyor::Question, title: "Sample question") }
  subject(:answer) { Surveyor::Answer.new(question: question, value: 3) }

  it "has a question" do
    expect(answer.question).to be(question)
  end

  it "has a value" do
    expect(answer.value).to eq(3)
  end
end
