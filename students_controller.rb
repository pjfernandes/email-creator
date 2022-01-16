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
    @view.display(student)
  end

end
