module Surveyor
  class RatingQuestion < Question
    def valid_answer?(answer)
      (1..5).cover?(answer)
    end
  end
end
