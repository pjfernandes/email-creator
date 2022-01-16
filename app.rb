require_relative 'student_repository'
require_relative 'students_controller'
require_relative 'router'

csv_file = File.join(__dir__, 'students.csv')
student_repository = StudentRepository.new(csv_file)
controller = StudentsController.new(student_repository)

router = Router.new(controller)

# Start the app
router.run
