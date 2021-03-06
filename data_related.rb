require 'json'
require 'pry'
require_relative 'book'
require_relative 'person'
require_relative 'student'
require_relative 'teacher'
require_relative 'rental'

# rubocop: disable Metrics

module DataLayer
  def object_to_hash(obj)
    obj.instance_variables.each_with_object({}) do |var, hash|
      key = var.to_s.delete('@')
      value = obj.instance_variable_get(var)
      if %w[Book Rental Person Student Teacher Classroom Corrector].include?(value.class.name)
        value = object_to_hash(value)
      end
      hash[key] = value
      case obj.class.name
      when 'Student'
        hash['type'] = 'Student'
      when 'Teacher'
        hash['type'] = 'Teacher'
      end
      hash
    end
  end

  def hash_to_object(hash, classname)
    case classname
    when 'Book'
      Book.new(hash['title'], hash['author'])
    when 'Rental'
      Rental.new(hash['date'], hash_to_object(hash['person'], 'Person'), hash_to_object(hash['book'], 'Book'))
    when 'Person'
      case hash['type']
      when 'Student'
        stud = Student.new(hash['classroom'], hash['age'], hash['name'], parent_permission: hash['parent_permission'])
        stud.id = hash['id']
        stud.rentals = hash['rentals'].map { |rental| hash_to_object(rental, 'Rental') }
        stud
      when 'Teacher'
        teach = Teacher.new(hash['age'], hash['specialization'], hash['name'],
                            parent_permission: hash['parent_permission'])
        teach.id = hash['id']
        teach.rentals = hash['rentals'].map { |rental| hash_to_object(rental, 'Rental') }
        teach
      end
    when 'Classroom'
      Classroom.new(hash['name'])
    end
  end

  def save_data(filename, data)
    File.open(filename, 'w') do |file|
      file.puts data.to_json
    end
  end

  def read_data(filename)
    data = []
    data = JSON.parse(File.read(filename)) if File.exist?(filename)
    data
  end
end
# rubocop: enable Metrics
