module Surveyor
  class Survey
    attr_reader :name, :questions, :responses

    def initialize(name:)
      @name = name
      @questions = []
      @responses = []
    end

    def add_question(question)
      questions.push(question)
    end

    def add_response(response)
      responses.push(response)
    end

    def find_user(email)
      responses.find { |res| res.email == email }
    end

    def user_responded?(email)
      !find_user(email).nil?
    end

    def answer_breakdown(question)
      ratings = { 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0 }

      results = responses.flat_map(&:answers)
        .select { |a| a.question == question }
        .group_by(&:value)
        .map { |rating, answers| [rating, answers.count] }
        .to_h

      ratings.merge(results)
    end
  end
end
