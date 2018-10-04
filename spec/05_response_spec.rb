require 'spec_helper'
require 'pry'

RSpec.describe Surveyor::Response do
  TEST_EMAIL = "user@domain.com".freeze
  subject { described_class.new(email: TEST_EMAIL) }

  it 'has a email' do
    expect(subject.email).to eq(TEST_EMAIL)
  end

  it 'returns true for a valid answer from a rating question' do
    rating_question = Surveyor::RatingQuestion.new(title: "sample ratings question")
    answer_to_ratings_question = Surveyor::Answer.new(
      question: rating_question,
      value: 5,
    )
    subject.add_answer(answer_to_ratings_question)
    expect(subject.answers).to include answer_to_ratings_question
  end

  it "returns false for a invalid answer from a rating question" do
    rating_question = Surveyor::RatingQuestion.new(title: "sample ratings question")
    answer_to_ratings_question = Surveyor::Answer.new(
      question: rating_question,
      value: 10,
    )
    expect { subject.add_answer(answer_to_ratings_question) }.to raise_error RuntimeError
  end
end
