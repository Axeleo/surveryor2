require 'spec_helper'

RSpec.describe Surveyor::Survey do
  subject { described_class.new(name: "Engagement Survey") }
  let(:email) { Surveyor::Email.new(address: "tim@test.com") }
  let(:response) { Surveyor::Response.new(email: email) }

  it "has a name" do
    expect(subject.name).to eq("Engagement Survey")
  end

  it "can have questions added" do
    question = double(:question)
    subject.add_question(question)
    expect(subject.questions).to include(question)
  end

  it "can have responses added" do
    response = double(:response)
    subject.add_response(response)
    expect(subject.responses).to include(response)
  end

  it "can find user by email" do
    subject.add_response(response)
    expect(subject.find_user(response.email)).to eq(response)
  end

  it "returns nil for a user who hasn't responded" do
    expect(subject.find_user("rick@test.com")).to eq nil
  end

  it "returns true if a user has reponded" do
    subject.add_response(response)
    expect(subject.user_responded?(response.email)).to be true
  end

  it "returns false if a user has not responded" do
    expect(subject.user_responded?("rick@test.com")).not_to be true
  end

  context "question breakdown" do
    let(:question_1) { Surveyor::RatingQuestion.new(title: "First sample question") }

    let(:response_1) { Surveyor::Response.new(email: "emma@test.com") }
    let(:response_2) { Surveyor::Response.new(email: "heather@test.com") }
    let(:response_3) { Surveyor::Response.new(email: "riley@test.com") }
    let(:response_4) { Surveyor::Response.new(email: "cam@test.com") }
    let(:response_5) { Surveyor::Response.new(email: "steve@test.com") }
    let(:response_6) { Surveyor::Response.new(email: "robert@test.com") }
    let(:response_7) { Surveyor::Response.new(email: "lily@test.com") }

    let(:answer_1) { Surveyor::Answer.new(question: question_1, value: 1) }
    let(:answer_2) { Surveyor::Answer.new(question: question_1, value: 2) }
    let(:answer_3) { Surveyor::Answer.new(question: question_1, value: 3) }
    let(:answer_4) { Surveyor::Answer.new(question: question_1, value: 4) }
    let(:answer_5) { Surveyor::Answer.new(question: question_1, value: 5) }

    before do
      response_1.add_answer(answer_1)
      response_2.add_answer(answer_2)
      response_3.add_answer(answer_2)
      response_4.add_answer(answer_4)
      response_5.add_answer(answer_5)
      response_6.add_answer(answer_4)
      response_7.add_answer(answer_5)

      subject.add_response(response_1)
      subject.add_response(response_2)
      subject.add_response(response_3)
      subject.add_response(response_4)
      subject.add_response(response_5)
      subject.add_response(response_6)
      subject.add_response(response_7)
    end

    it 'returns a correct breakdown' do
      expect(subject.answer_breakdown(question_1)).to eq(
        1 => 1,
        2 => 2,
        3 => 0,
        4 => 2,
        5 => 2,
      )
    end
  end
end
