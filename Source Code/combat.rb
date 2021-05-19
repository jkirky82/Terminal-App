require_relative 'main.rb'
require "tty-prompt"

class Combat
  @@prompt = TTY::Prompt.new

  def player_turn(weapon,spells,potions)
    choices = %w(Attack Spells Potion)
    case @@prompt.multi_select("What will it be", choices, max: 1)

    when 'Attack'
      attack(weapon)
    when 'Spells'

    when 'Potion'
    end
  end

  def attack(weapon)
    weapon
  end

  def spells 

  end

  def potion 
  end
end