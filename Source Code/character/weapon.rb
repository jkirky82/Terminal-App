require "tty-prompt"

class Weapon
  @@prompt = TTY::Prompt.new
  attr_accessor :weapon

  #User selected weapon 
  def water_weapons
    puts 'Choose your weapon'
    choices = %w(Bow Spear)
    answer = @@prompt.select("What will it be", choices)
    @weapon = {:name => answer, :dmg => 30} #The weapons are all the same besides the name 
  end

  def fire_weapons
  end

  def earth_weapons
  end
end