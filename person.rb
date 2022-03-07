# frozen_string_literal: true

require_relative 'corrector'

class Person
  attr_accessor :name, :age, :rentals
  attr_reader :id

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

  def add_rental(rental)
    @rentals << rental
    rental.person = self unless rental.person == self
  end

  private

  def of_age?
    @age >= 18
  end
end
