require_relative 'character/class.rb'
require_relative 'character/weapon.rb'
require_relative 'combat.rb'
require_relative 'path.rb'

class Character 
  attr_reader :name, :age 
  attr_accessor :classes, :weapon, :health_points, :abilitys

  def initialize
    @name = name_validator
    @age = age_validator
    class_ability = Classes.new
    @abilitys = class_ability.chosen_list
    @class = class_ability.class
    @weapon = chose_weapon
    @health_points = 200
    character
  end

  def character
    system("clear")
    puts "You are #{@name}, aged #{@age} from the #{@class} tribe, rocking the #{@weapon[:name]}"
    sleep(5)
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
  
end

puts "Welcome to my game"
player = Character.new
path = Path.new
i = 1
while i < 6
  Combat.new(player, i)
  path_choice = path.three_path
  puts path_choice
  if path_choice == 'combat'
  else
    path.treasure(player)
  end
  i += 1
end
puts "Game over you won"
