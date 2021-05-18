class Character 
  attr_reader :name, :age
  def initialize(name, age)
    @name = name
    @age = age
  end
end

#Check to see if name has no numbers 
def name_validator(name)
  until name[/\d/].nil? do
     puts "Your name must only have letters input again"
     name = gets.strip
  end
  return name
end

#check to see if input age is a number 
def age_validator(age)
  until age > 16
    begin 
      if age >! 16
      end
    rescue => e
      puts "Input must be a valid number above 16"
      age = gets.strip.to_i
    end
  end
  return age
end

puts "Welcome to my game"
puts "Whats your characters name"
name = name_validator(gets.strip)
puts "whats your characters age" 
age = age_validator(gets.strip.to_i)

player_one = Character.new(name,age)

