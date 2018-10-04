module Surveyor
  class Email
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    attr_reader :address

    def initialize(address:)
      @address = address
    end

    def valid?
      VALID_EMAIL_REGEX.match?(address)
    end
  end
end
