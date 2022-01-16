class Student

  attr_accessor :id, :status
  attr_reader :name, :number, :phone, :email, :uffmail, :status

  def initialize(attributes = {})
    @name = attributes[:name]
    @number = attributes[:number]
    @phone = attributes[:phone]
    @email = attributes[:email]
    @uffmail = attributes[:uffmail]
    @status = attributes[:status]
  end

end
