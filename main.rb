require_relative 'refactor'

def main
  app = App.new
  app.intro
end

class App
  def initialize
    @refactored = Refactor.new
  end
  def intro
    puts 'Welcome to School Library App!'
    loop do
      intro_cases
      case_entry = gets.chomp.to_i
      break if case_entry == 7
      @refactored.case_chosen(case_entry)
    end
  end
  def intro_cases
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
end

main
