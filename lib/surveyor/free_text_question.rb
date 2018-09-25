module Surveyor
  class FreeTextQuestion < Question
    attr_reader :title

    def initialize(title:)
      @title = title
    end

    def valid_answer?(answer)
      answer.is_a?(String)
    end
  end
end
