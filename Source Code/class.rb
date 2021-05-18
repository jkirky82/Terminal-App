require_relative 'abilites.rb'
require "tty-prompt"

#User selects what class they would like.
class Classes
  @@prompt = TTY::Prompt.new
  #When class is called will prompt the user to select what class they would like.
  def initialize
    puts "what class would you like to be"
    case @@prompt.select("Choose your Class?", %w(Water Fire Earth))
    #Depending on the selection it will then send to the respected function 
    when 'Water'
      abilitie = water
    when'Fire' 
      abilitie = fire
    when 'Earth'
      abilitie = earth
    end
    #Sends the abilite list to another class and returns an array with a hash inside with the abilitie name, damage, and type
    abilitie_class = Abilities.new
    chosen_list = abilitie_class.abilities(abilitie)
    return chosen_list
  end

  #Functions depending on what class user would like to be.
  def water
    #Displays all the abilites that they can select from and reutnr an array with the names
    choices = %w(Wall\ of\ Water Splash Water\ Shield Tidal\ Wave)
    return @@prompt.multi_select("What will it be", choices, max: 3)
  end

  def fire
    choices = %w(Wall\ of\ Water Splash Water\ Shield Tidal\ Wave)
    return @@prompt.multi_select("Select drinks?", choices, max: 3)
  end

  def earth
    choices = %w(Wall\ of\ Water Splash Water\ Shield Tidal\ Wave)
    return answer = @@prompt.multi_select("Select drinks?", choices, max: 3)
  end
end