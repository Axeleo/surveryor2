module Surveyor
  class FreeTextQuestion < Question
    MAX_CHAR_LIMIT = 50_000

    def initialize(title:)
      @title = title
    end

    def valid_answer?(answer)
      answer.is_a?(String) && answer.length < MAX_CHAR_LIMIT
    end
  end
end
