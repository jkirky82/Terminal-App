require_relative 'class.rb'
class Character 
  attr_reader :name, :age
  def initialize
    @name = name_validator
    @age = age_validator

    tes = Classes.new 
    p tes.to_s
  end
  #Check to see if name has no numbers 
  def name_validator
    puts "Whats your characters name"
    name = gets.strip
    until name[/\d/].nil? do
      puts "Your name must only have letters input again"
      name = gets.strip
    end
    return name
  end

  #check to see if input age is a number 
  def age_validator
    puts "whats your characters age" 
    age = gets.strip.to_i
    until age > 16
      begin 
        if age >! 16
        end
      rescue => e
        puts "Input must be a valid number above 16, Try Again"
        age = gets.strip.to_i
      end
    end
    return age
  end
end


puts "Welcome to my game"

player_one = Character.new

