require_relative "../models/student.rb"
require 'csv'

class StudentRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @students = []
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @students
  end

  def find(number)
    @students.select { |student| number == student.number }
  end

  CSV_OPTIONS = {headers: :first_row, header_converters: :symbol}

  private
  def load_csv
    CSV.foreach(@csv_file_path, CSV_OPTIONS) do |row|
      @students << Students.new(name: row[:name],
                                number: row[:number],
                                phone: row[:phone],
                                email: row[:email],
                                uffmail: row[:uffmail],
                                status: row[:status])
    end
  end
end
