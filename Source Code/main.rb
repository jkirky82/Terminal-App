require_relative 'character/class.rb'
require_relative 'character/weapon.rb'
require_relative 'combat.rb'

class Character 
  attr_reader :name, :age 
  attr_accessor :classes, :weapon, :health_points

  def initialize
    @name = name_validator
    @age = age_validator
    class_ability = Classes.new
    @abilitys = class_ability.chosen_list
    @class = class_ability.class
    @weapon = chose_weapon
    @health_points = 20
  
  end

  def chose_weapon
    if @class == 'Water'
      chosen_weapon = Weapon.new
      return chosen_weapon.water_weapons
    end
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
  Combat.new
end

puts "Welcome to my game"
Character.new