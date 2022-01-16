class View

  def ask_for_student_number
    puts "Digite sua matrícula: "
    gets.chomp.to_i
  end

  def display(student)
    first_name = student.name.split.first.capitalize
    last_name = student.name.split.last
    student_phone = student.phone

    email_suggestions = []
    email_suggestions << "#{first_name.downcase}_#{last_name.downcase}@id.uff.br"
    email_suggestions << "#{last_name.downcase}_#{first_name.downcase}@id.uff.br"
    email_suggestions << "#{first_name.downcase}#{last_name.downcase}@id.uff.br"
    email_suggestions << "#{first_name.downcase[0]}#{last_name.downcase}@id.uff.br"
    email_suggestions << "#{first_name.downcase}#{last_name.downcase[0]}@id.uff.br"

    puts "#{first_name}, por favor escolha uma das opções abaixo para o seu UFFMail"

    5.times do
      index = 0
      puts "#{index + 1} - #{email_suggestions[index]}"
      index += 1
    end

    user_option = gets.chomp.to_i - 1

    puts "A criação de seu e-mail (#{email_suggestions[user_option]}) será feita nos próximos minutos."
    puts "Um SMS foi enviado para #{student_phone} com a sua senha de acesso."
  end

end
