module Surveyor
  class Question
    attr_reader :title

    def initialize(title:)
      @title = title
    end

    def valid_answer(answer)
      raise "implement valid_answer in child class"
    end
  end
end
