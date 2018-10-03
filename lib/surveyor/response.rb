module Surveyor
  class Response
    attr_reader :email, :answers

    def initialize(email:, answers: [], **_additional_arguments)
      @email = email
      @answers = answers
    end

    def add_answer(answer)
      raise "Answer's value is not valid" unless answer.valid?

      answers.push(answer)
    end
  end
end
