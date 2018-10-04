require 'spec_helper'
RSpec.describe Surveyor::Email do
  it "can accept a valid email address" do
    valid_email = Surveyor::Email.new(address: "correct@domain.email")
    expect(valid_email).to be_valid
  end

  it " can recognise a valid email adress with a subdomain" do
    subdomain_email = Surveyor::Email.new(address: "user@dom.subdom")
    expect(subdomain_email). to be_valid
  end

  it "rejects an invalid email address" do
    invalid_email = Surveyor::Email.new(address: "thisthenthat.com")
    expect(invalid_email).not_to be_valid
  end
end
