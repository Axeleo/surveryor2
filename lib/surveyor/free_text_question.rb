module Surveyor
  class FreeTextQuestion < Question
    def initialize(title:)
      @title = title
      @max_char_limit = 50_000
    end

    def valid_answer?(answer)
      answer.is_a?(String) && answer.length < @max_char_limit
    end
  end
end
