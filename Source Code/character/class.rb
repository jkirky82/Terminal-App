require_relative 'ability.rb'
require "tty-prompt"

#User selects what class they would like.
class Classes
  attr_reader :chosen_list, :class
  @@prompt = TTY::Prompt.new
    
#Use tty table to list all the skills.


  #When class is called will prompt the user to select what class they would like.
  def initialize
    puts "what class would you like to be"
    case @@prompt.select("Choose your Class?", "Water".colorize(:blue), "Fire".colorize(:red), "Earth".colorize(:green))
    #Depending on the selection it will then send to the respected function 
    when 'Water'.colorize(:blue)
      ability = water #Shows the user a list of water abilites they can select from 
      @class = 'Water'
    when'Fire'.colorize(:red)
      ability = fire
      @class = 'Fire'
    when 'Earth'.colorize(:green)
      ability = earth
      @class = 'Earth'
    end

    #Sends the abilite list to another class and returns an array with a hash inside with the ability name, damage, and type
    ability_class = Ability.new
    @chosen_list = ability_class.ability(ability)
  end

  #Functions depending on what class user would like to be.
  def water
    #Displays all the abilites that they can select from and reutnr an array with the names
    choices = %w(Wall\ of\ Water Splash Water\ Shield Tidal\ Wave)
    return @@prompt.multi_select("What will it be", choices, max: 3)
  end

  def fire
    choices = %w(Fire\ bolt Fire\ Wall Fire\ bomb Flame\ Fist)
    return @@prompt.multi_select("Select drinks?", choices, max: 3)
  end

  def earth
    choices = %w(Stone\ Wall Earthquake Tomb\ Stone Rock\ Smash)
    return answer = @@prompt.multi_select("Select drinks?", choices, max: 3)
  end
end