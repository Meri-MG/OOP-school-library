require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './corrector'
require_relative './rental'
require_relative './data_related'

class Refactor
  include DataLayer
def initialize
    @people = []
    @rentals = []
  end

  def intro_cases
    puts '',
         'Please choose an option by entering a number:',
         '1 - List all books',
         '2 - List all people',
         '3 - Create a person',
         '4 - Create a book',
         '5 - Create a rental',
         '6 - List all rental for a given person id',
         '7 - Exit'

    case_entry = gets.chomp.to_i
    case_chosen(case_entry)
  end

def case_chosen(choice)
    case choice
    when 1
      list_books
      intro_cases
    when 2
      list_people
      intro_cases
    when 3
      create_person
      intro_cases
    when 4
      create_book
      intro_cases
    when 5
      create_rental
      intro_cases
    when 6
      rental_by_id
      intro_cases
    when 7
      books_path = Book.class_variable_get(:@@books_filename)
      books_data = Book.class_variable_get(:@@books).map { |obj| object_to_hash(obj) }
      people_path = Person.class_variable_get(:@@people_filename)
      people_data = Person.class_variable_get(:@@people).map { |obj| object_to_hash(obj) }
      rentals_path = Rental.class_variable_get(:@@rentals_filename)
      rentals_data = Rental.class_variable_get(:@@rentals).map { |obj| object_to_hash(obj) }
      save_data(books_path, books_data)
      save_data(people_path, people_data)
      save_data(rentals_path, rentals_data)
    else
      puts 'Seems like an invalid entry!'
    end
  end

  def list_books
    Book.class_variable_get(:@@books).each_with_index.map { |book, i| puts "#{i}) Title: #{book.title}, Author: #{book.author} " }
  end

  def list_people
    Person.class_variable_get(:@@people).map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, age: #{person.age}" }
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    num_input = gets.chomp.to_i
    case num_input
    when 1
      create_student
    when 2
      create_teacher
    end

    puts 'Person Created Successfully'
  end

  def create_student
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp.downcase

    print 'Has parent\'s permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    new_student = Student.new(@classroom, age, name, parent_permission: parent_permission)
    Student.class_variable_get(:@@people) << new_student
    @people << new_student
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp.downcase

    print 'Specialization: '
    specialization = gets.chomp.downcase

    new_teacher = Teacher.new(age, specialization, name)
    Teacher.class_variable_get(:@@people) << new_teacher
    @people << new_teacher
  end

  def create_book
    print 'Title: '
    get_title = gets.chomp.downcase
    print 'Author: '
    get_author = gets.chomp.downcase

    new_book = Book.new(get_title, get_author)
    Book.class_variable_get(:@@books) << new_book

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a person from the following list by number: '

    Person.class_variable_get(:@@people).each_with_index.map do |person, i|
      puts "#{i + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, age: #{person.age}"
    end
    selected_person = gets.chomp.to_i

    puts 'Select a book from the following list by number: '

    Book.class_variable_get(:@@books).each_with_index.map { |book, i| puts "#{i + 1}) Title: #{book.title}, Author: #{book.author}" }
    selected_book = gets.chomp.to_i

    print 'Enter Date in this format DD/MM/YYYY: '

    date = gets.chomp

    if selected_person > @people.length || selected_book > @people.length
      puts 'Inavlid selection for person or book choice'
    else
      new_rental = Rental.new(date, @people[selected_person], @books[selected_book])
      Rental.class_variable_get(:@@rentals) << new_rental
      @rentals.push(new_rental)
      puts 'Rental Created succesfully'
    end
  end

  def get_person_info

  end

  def rental_by_id
    Person.class_variable_get(:@@people).each_with_index.map do |person, i|
      puts "#{i + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, age: #{person.age}"
    end
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals: '
    @rentals.each do |rental|
      if rental.person.id == person_id
        puts "Date: #{rental.date}, Book: #{rental.book.title} by Author: #{rental.book.author} "
      end
    end
  end
end
