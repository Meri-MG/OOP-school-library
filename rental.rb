require_relative './book'
require_relative './person'
require_relative './data_related'

class Rental
  @@rentals_filename = 'rentals.json'
  @@rentals = []

  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date

    @book = book

    @person = person
  end

  def self.overwrite_rentals(arr)
    @@rentals = arr
  end
end
