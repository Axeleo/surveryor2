module Surveyor
  class RatingQuestion < Question
    attr_reader :title

    def initialize(title:)
      @title = title
    end

    def valid_answer?(answer)
      (1..5).cover?(answer)
    end
  end
end
