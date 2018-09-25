module Surveyor
  class Survey
    attr_reader :name, :questions, :responses

    def initialize(name:)
      @name = name
      @questions = []
      @responses = []
    end

    def add_question(question)
      @questions.push(question)
    end

    def add_response(response)
      @responses.push(response)
    end

    def find_user(email)
      @responses.find { |res| res.email == email }
    end

    def has_user_responded?(email)
      !find_user(email).nil?
    end
  end
end
