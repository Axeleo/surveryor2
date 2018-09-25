require 'spec_helper'

RSpec.describe Surveyor::Survey do
  subject { described_class.new(name: "Engagement Survey") }
  let(:response) { Surveyor::Response.new(email: "tim@test.com") }

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
    expect(subject.has_user_responded?(response.email)).to be true
  end

  it "returns false if a user has not responded" do
    expect(subject.has_user_responded?("rick@test.com")).not_to be true
  end
end
