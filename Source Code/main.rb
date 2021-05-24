require_relative 'character/class.rb'
require_relative 'character/weapon.rb'
require_relative 'combat.rb'
require_relative 'path.rb'
require 'artii'

class Character 
  attr_reader :name, :age 
  attr_accessor :classes, :weapon, :health_points, :abilitys, :max_health_points

  def initialize
    @name = name_validator
    @age = age_validator
    class_ability = Classes.new
    @abilitys = class_ability.chosen_list
    @class = class_ability.class
    @weapon = chose_weapon
    @max_health_points = 200
    @health_points = 200
    character
  end

  #displays the game name and the created character
  def character
    system("clear")
    a = Artii::Base.new :font => 'slant'
    puts a.asciify('Fantasy Final')
    sleep(5)
  end

  #Gets the use to select a weapon based of the chosen class
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
    until name[/\d/].nil? do          #uses regular expressions to see if the name has anything other then letters
      puts "Your name must only have letters input again"
      name = gets.strip
    end
    return name
  end

  #check to see if input age is a number 
  def age_validator
    puts "whats your characters age" 
    age = gets.strip.to_i 
    until age > 16 #checks to see if name is a number 
      begin 
        if age >! 16
        end
      rescue  #rescues if there is an error because its not an integer 
        puts "Input must be a valid number above 16, Try Again"
        age = gets.strip.to_i
      end
    end
    return age
  end
  
end

#starts game 
system ("clear")
a = Artii::Base.new :font => 'slant'
puts a.asciify('Welcome to my game')

player = Character.new      #Sends user to create a character
path = Path.new             #Sets up the path class for later use
i = 1
while i < 6 #Loops through 6 times each making the combat harder 
  Combat.new(player, i)           #Sends user to combat and the level they are on
  path_choice = path.three_path   #After user selects a path it will random which way they go and return it
  if path_choice == 'combat' 
    sleep(4)
    puts "You follow your hear and follow the path"
    sleep(3)
    puts a.asciify('RRRRRRRRRRRRR')
    sleep(5)
  else
    puts "You follow your hear and follow the path"
    sleep(3)
    puts "Oh whats this "
    path.treasure(player)       #player will get a random treasure room
  end
  i += 1 
end

system ("clear")
puts a.asciify('Game Over you won')
