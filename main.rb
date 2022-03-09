require_relative 'refactor'

def main
  app = App.new
  app.intro
end

class App
  include DataLayer

  def initialize
    @refactored = Refactor.new
  end

  def run
    # Load files

    # Books
    books_path = Book.class_variable_get(:@@books_filename)
    Book.overwrite_books(read_data(books_path).map { |hash| hash_to_object(hash, 'Book') })

    # People
    people_path = Person.class_variable_get(:@@people_filename)
    Person.overwrite_people(read_data(people_path).map { |hash| hash_to_object(hash, 'Person') })

    # Rentals
    rentals_path = Rental.class_variable_get(:@@rentals_filename)
    Rental.overwrite_rentals(read_data(rentals_path).map { |hash| hash_to_object(hash, 'Rental') })
  end

  def intro
    puts 'Welcome to School Library App!'
    run
    @refactored.intro_cases
  end
end

main
