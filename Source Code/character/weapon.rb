require "tty-prompt"

class Weapon
  @@prompt = TTY::Prompt.new
  attr_accessor :weapon
  def water_weapons
    puts 'Choose your weapon'
    choices = %w(Bow Spear)
    case @@prompt.multi_select("What will it be", choices, max: 1)
    when 'Bow'
      @weapon = {:name => "Bow", :dmg => 3}
    when'Spear' 
      @weapon = {:name => "spear", :dmg => 3}
    end
    
  end

  def fire_weapons
  end

  def earth_weapons
  end
end