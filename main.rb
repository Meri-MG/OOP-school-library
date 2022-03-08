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
    @refactored.intro_cases
  end
  
end

main
