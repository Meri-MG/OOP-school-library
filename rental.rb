require_relative './book'
require_relative './person'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end
end

book = Book.new('title', 'author')
pers = Person.new(21)

p book.rentals.push(book)
p book
p pers.rentals
