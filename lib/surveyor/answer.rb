module Surveyor
  class Answer
    attr_reader :question, :value

    def initialize(question:, value: '')
      @question = question
      @value = value
    end

    def valid?
      question.valid_answer?(value)
    end
  end
end
