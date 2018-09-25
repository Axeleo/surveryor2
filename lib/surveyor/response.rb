module Surveyor
  class Response
    attr_reader :email, :answers

    def initialize(email:, answers: [], **_additional_arguments)
      @email = email
      @answers = answers
    end

    def add_answer(answer)
      if answer.question.valid_answer?(answer.value)
        @answers.push(answer)
      else
        raise "Answer's value is not valid"
      end
    end
  end
end
