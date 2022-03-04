def main
  def intro_text
    puts 'Welcome to School Library App!'
    puts ''
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rental for a given person id'
    puts '7 - Exit'
  end

  def intro
    loop do 
      get_entry = gets.chomp.to_i
    intro_text
    break if get_entry != 7
    end
  end
end

main.intro()