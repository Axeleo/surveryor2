require 'spec_helper'
RSpec.describe Surveyor::Email do
  it "can accept a valid email address" do
    valid_email = Surveyor::Email.new(address: "correct@domain.email")
    expect(valid_email).to be_valid
  end

  it "is valid an email address with a subdomain" do
    subdomain_email = Surveyor::Email.new(address: "user@dom.subdom")
    expect(subdomain_email). to be_valid
  end

  it "is invalid for a address which is not an email address" do
    invalid_email = Surveyor::Email.new(address: "thisthenthat.com")
    expect(invalid_email).not_to be_valid
  end
end
