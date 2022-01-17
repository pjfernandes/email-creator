require_relative "view"
require_relative "student"

class StudentsController

  def initialize(student_repository)
    @student_repository = student_repository
    @view = View.new
  end

  def new_email
    student_number = @view.ask_for_student_number
    student = @student_repository.find(student_number)
    if student.nil?
      @view.display_not_found

    elsif student.nil? == false && student.status == "Ativo"
      if student.uffmail.nil?
        @view.display(student)
      else
        @view.display_user_already_has_iduff
      end
    end
  end

  def add_student
    student_name = @view.ask_user_for(:name)
    student_number = @view.ask_user_for(:number).to_i
    student_phone = @view.ask_user_for(:phone)
    student_email = @view.ask_user_for(:email)
    student_uffmail = @view.ask_user_for(:uffmail)
    student_status = @view.ask_user_for(:status).capitalize
    student = Student.new(
      name: student_name,
      number: student_number,
      phone: student_phone,
      email: student_email,
      uffmail: student_uffmail,
      status: student_status
    )
    @student_repository.create(student)
  end

end
