module Response
 class Response
  attr_reader :email

  def initialize(email:, **_additional_arguments)
    @email = email
  end
 end
end