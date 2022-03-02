class Corrector
  def correct_name(name)
    name = name.capitalize
    return name.slice(0...10) unless name.length < 10
  end
end

name_one = Corrector.new
puts name_one.correct_name('dsvbdfhvsbujhjv')
