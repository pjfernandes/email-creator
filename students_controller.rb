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
    if student.nil? == false && student.status == "Ativo"
      @view.display(student)
    elsif student.nil?
      @view.display_not_found
    end
  end

end
