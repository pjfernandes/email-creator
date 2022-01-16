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
    when 2 then stop
    else
      puts "Digite 1 ou 2"
    end
  end

  def stop
    @running = false
  end

  def display_tasks
    puts ""
    puts "Escolha uma opção"
    puts "1 - Criar novo uffmail"
    puts "2 - Sair do programa"
  end

end
