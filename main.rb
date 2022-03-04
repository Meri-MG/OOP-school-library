require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './classroom'
require_relative './book'
require_relative './corrector'
require_relative './rental'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def intro
    puts 'Welcome to School Library App!'

    loop do
      intro_cases

      case_entry = gets.chomp.to_i

      break if case_entry == 7

      case_chosen(case_entry)
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

  def case_chosen(choice)
    case choice
    when 1
      list_books
    when 2
      list_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      rental_by_id
    else
      puts 'Invalid Entry'
    end
  end

  def list_books
    @books.each_with_index.map { |book, i| puts "#{i}) Title: #{book.title}, Author: #{book.author} " }
  end

  def list_people
    @people.map { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, age: #{person.age}" }
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
    @people << new_teacher
  end

  def create_book
    print 'Title: '
    get_title = gets.chomp.downcase
    print 'Author: '
    get_author = gets.chomp.downcase

    new_book = Book.new(get_title, get_author)
    @books << new_book

    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a person from the following list by number: '

    @people.each_with_index.map do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, age: #{person.age}"
    end
    selected_person = gets.chomp.to_i

    puts 'Select a book from the following list by number'

    @books.each_with_index.map { |book, i| puts "#{i}) Title: #{book.title}, Author: #{book.author}" }
    selected_book = gets.chomp.to_i

    print 'Enter Date in this format DD/MM/YYYY: '

    date = gets.chomp

    if selected_person > @people.length || selected_book > @people.length
      puts 'Inavlid selection for person or book choice'
    else
      new_rental = Rental.new(date, @people[selected_person], @books[selected_book])
      @rentals.push(new_rental)
      puts 'Rental Created succesfully'
    end
  end

  def rental_by_id
    @people.each_with_index.map do |person, i|
      puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, age: #{person.age}"
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

def main
  app = App.new
  app.intro
end

main
