class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age:, name: 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    @age >= 18 || parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
