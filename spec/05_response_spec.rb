require 'spec_helper'
require 'pry'

RSpec.describe Surveyor::Response do
  subject { described_class.new(email: "test@test.com") }

  it 'has a email' do
    expect(subject.email).to eq("test@test.com")
  end

  it 'accepts a valid answer from a rating question' do
    rating_question = Surveyor::RatingQuestion.new(title: "sample ratings question")
    answer_to_ratings_question = Surveyor::Answer.new(
      question: rating_question,
      value: 5,
    )
    subject.add_answer(answer_to_ratings_question)
    expect(subject.answers.count).to eq 1
  end

  it "rejects an invalid answer from a rating question" do
    rating_question = Surveyor::RatingQuestion.new(title: "sample ratings question")
    answer_to_ratings_question = Surveyor::Answer.new(
      question: rating_question,
      value: 10,
    )
    expect { subject.add_answer(answer_to_ratings_question) }.to raise_error RuntimeError
  end
end
