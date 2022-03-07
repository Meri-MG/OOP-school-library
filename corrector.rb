class Corrector
  def correct_name(name)
    name = name.capitalize
    return name.slice(0...10) if name.length > 10 || name.length < 10
  end
end
