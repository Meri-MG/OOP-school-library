require_relative 'corrector'

# rubocop: disable Style/ClassVars

class Person
  @@people_filename = 'people.json'
  @@people = []

  attr_accessor :name, :age, :rentals, :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @id = Random.rand(1...1000)
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def can_use_services?
    @age >= 18 || parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(@name)
  end

  def add_rental(rental) end

  def self.overwrite_people(arr)
    @@people = arr
  end

  private

  def of_age?
    @age >= 18
  end
end

# rubocop: enable Style/ClassVars
