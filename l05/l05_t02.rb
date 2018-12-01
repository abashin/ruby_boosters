class Camp
  attr_reader :place
  attr_reader :type
  attr_reader :age
  attr_reader :spetial
  attr_reader :direction
  attr_reader :mobile_number
  def info
    puts "место: place"
    puts "тип: type"
    puts "возраст детей: age"
    puts "обратная связь: mobile_number"
    puts "особенности: direction"
    puts "специализация spetial"
  end
  
end