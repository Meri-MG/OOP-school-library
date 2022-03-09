class Book
  @@books = []
  @@books_filename = 'books.json'

  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental) end

  def self.overwrite_books(arr)
    @@books = arr
  end
end
