require_relative './book'
require_relative './person'

class Rental
  @@rentals_filename = 'rentals.json'
  @@rentals = []

  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date

    @book = book
    book.rentals.push(self)

    @person = person
    person.rentals.push(self)
  end

  def self.overwrite_rentals(arr)
    @@rentals = arr
  end
end
