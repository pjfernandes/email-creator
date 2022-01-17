require_relative 'student'
require 'csv'

class StudentRepository

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @students = []
    load_csv if File.exist?(@csv_file_path)
  end

  def create(student)
    @students << student
    save_csv
  end

  def all
    @students
  end

  def find(number)
    @students.find { |student| number == student.number.to_i }
  end

  CSV_OPTIONS = {headers: :first_row, header_converters: :symbol}

  private
  def load_csv
    CSV.foreach(@csv_file_path, CSV_OPTIONS) do |row|
      @students << Student.new(name: row[:nome], number: row[:matricula].to_i, phone: row[:telefone], email: row[:email],
                              uffmail: row[:uffmail], status: row[:status])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['nome', 'matricula', 'telefone', 'email', 'uffmail', 'status']
      @students.each do |student|
        csv << [student.name, student.number, student.phone, student.email, student.uffmail, student.status]
      end
    end
  end

end
