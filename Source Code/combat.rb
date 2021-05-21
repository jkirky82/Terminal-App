require_relative 'enemy.rb'
require "tty-prompt"

class Combat
  @@prompt = TTY::Prompt.new

  def initialize
    @player = Character.new
    @enemy = Enemy.new
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
      puts "hit"
      @enemy.enemy_health_points -= @player.weapon[:dmg]
      puts @enemy.enemy_health_points
    else
      puts "Missed"
      enemy_turn
    end

    if @enemy.enemy_health_points <= 0 
      puts "You won the fight"
      return
    end
  end

  #players spells 
  def spells 
    @player.abilitys.each do |d| puts d[:title] end
  
    # @@prompt.select("What will it be", @player.abilitys.each do |d| d[:title] end, max: 1)
  end

  #players potion options 
  def potion 
  end

  #enemy turn attack 
  def enemy_turn
    if rand(1..20) + 2 <= 16 #player armor class
    end
    if @player.health_points == 0
      puts "you died game over"
      exit!
    end  
  end
end