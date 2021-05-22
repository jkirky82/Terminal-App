require_relative 'enemy.rb'
require "tty-prompt"

class Combat 
  @@prompt = TTY::Prompt.new

  def initialize(tes, level)
    puts `clear` #clears the terminal
    puts "whats that sounds"
    sleep(2)
    @player = tes
    @enemy = Enemy.new(1)
    puts "An angry looking #{@enemy.enemy_type} approach" #change text size 
    rounds
  end

  def rounds
    while @enemy.enemy_health_points >= 0 
      case @@prompt.select("What will it be", %w(Attack Spells Potion), max: 1)
      when 'Attack'
        attack
      when 'Spells'
        spells
      when 'Potion'
      end
    end
  end

  #players attack with weapon
  def attack
    if rand(1..20) + 2 <= @enemy.enemy_armor_score 
      sleep(3)
      puts "hit"
      @enemy.enemy_health_points -= @player.weapon[:dmg]
      return if enemy_life == true
    else
      sleep(3)
      puts "Missed"
    end
    enemy_turn
  end

  #players spells 
  def spells 
    #Loops through chosen skills and displays them as a pickable option
    chosen_spell = @@prompt.select("What will it be", max: 1) do |menu|
      @player.abilitys.each do |spells| 
        menu.choice spells[:title]
      end
    end
    #loops through and checks chosen answer and uses the dmg part of the array to deal damage to enemy
    @player.abilitys.each do |spells| 
      if spells[:title] == chosen_spell
        @enemy.enemy_health_points -= spells[:dmg]
        return if enemy_life == true
      end
    end
    enemy_turn
  end

  #players potion options 
  def potion 
  end

  def enemy_life
    if @enemy.enemy_health_points <= 0 
      puts "You won the fight"
      return true
    end
  end

  #enemy turn attack 
  def enemy_turn
    puts "The #{@enemy.enemy_type} goes for an attack"
    if rand(1..20) + 2 <= 16 #player armor class
      sleep(3)
    end
    if @player.health_points == 0
      puts "you died game over"
      exit!
    end  
  end
end