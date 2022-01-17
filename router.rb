class Router

  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Seja bem-vindo(a) ao app"
    puts "           --           "

    while @running
      display_tasks
      action = gets.chomp.to_i
      print `clear`
      route_action(action)
    end
  end

  private

  def route_action(action)
    case action
    when 1 then @controller.new_email
    when 2 then @controller.add_student
    when 3 then stop
    else
      puts "Digite 1, 2 ou 3"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "Escolha uma opção"
    puts "1 - Criar novo uffmail"
    puts "2 - Cadastrar novo estudante"
    puts "3 - Sair do programa"
  end

end
