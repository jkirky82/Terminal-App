require_relative 'enemy.rb'
require_relative 'character/character_models.rb'
require "tty-prompt"

class Combat 
  @@prompt = TTY::Prompt.new

  def initialize(tes, level)
    #Some text before combat
    system ("clear") #clears the terminal
    @player = tes
    @enemy = Enemy.new(1)
    puts "An angry looking #{@enemy.enemy_type} approach".center(150) #change text size 
    rounds
  end

  #Loops through combat untill someone has no health left
  def rounds          #Displays a health bar and a image of the monster
    while @enemy.enemy_health_points > 0 
      puts "\n\n"
      system("clear")
      monster_health
      puts ""
      case @@prompt.select("Your move, What will it be", %w(Attack Spells))    #User selects how they want to attack
      when 'Attack'
        attack
      when 'Spells'
        spells
      end
      system ("clear")
      monster_health
    end
  end

  #players attack with weapon
  def attack
    if rand(1..20) + 2 <= @enemy.enemy_armor_score 
      sleep(2)
      system("clear")
      @enemy.enemy_health_points -= @player.weapon[:dmg]
      monster_health
      puts ""
      puts "You Smach the monster"
      sleep(2)
      return if enemy_life == true
    else
      sleep(2)
      puts "Your attack was just wide"
      sleep(2)
    end
    enemy_turn
  end

  #players spells 
  def spells 
    spell_pp = false
    while spell_pp != true
      #Loops through chosen skills and displays them as a pickable option
      chosen_spell = @@prompt.select("What will it be", max: 1) do |menu|
        @player.abilitys.each do |spells| 
          menu.choice spells[:title]
        end
        menu.choice "Exit"
      end
      #loops through and checks chosen answer and uses the dmg part of the array to deal damage to enemy
      @player.abilitys.each do |spells| 
        if spells[:title] == chosen_spell
          if spells[:pp] == 0
            puts "You dont have enough enegery to cast that spell anymore"
          else
            puts "You build up energy and realese it"
            sleep (2)
            system("clear")
            @enemy.enemy_health_points -= spells[:dmg]
            monster_health
            sleep(2)
            spells[:pp] -= 1
            spell_pp = true
            return if enemy_life == true
          end
        elsif chosen_spell == "Exit"
          return
        end
      end
    end
    enemy_turn
  end

  def enemy_life
    if @enemy.enemy_health_points <= 0 
      system("clear")
      monster_health
      puts "You won the fight"
      return true
    end
  end

  #enemy turn attack 
  def enemy_turn
    puts "Its winding up"
    sleep(2)
    if rand(1..20) + 2 <= 16  #player armor class       #random number between 1-20 and if its 16 or higher the attack hits 
      puts "You can't get out of the way fast enoguh"   
      @player.health_points -= @enemy.enemy_attack      #Players health minus the enemys damage 
    else
      puts "You just dodge the atttack"
    end
    sleep(3)
    if @player.health_points <= 0  # If the players health is less then 0 end the game ends and you lose
      do_health(@player.max_health_points,@player.health_points)
      puts "you died game over"
      exit! #exits the program
    end  
  end

  #creates a health bar with the maxhp and current health
  def do_health(maxHealth,health)
    health = health.to_f
    maxHealth = maxHealth.to_f

    if health < 0 #if the current health is less then 0 it makes it zero so no errors occur
      health = 0
    end
    healthDashes = 40 # Max Displayed dashes
    dashConvert = (maxHealth/healthDashes)            # Get the number to divide by to convert health to dashes 
    currentDashes = (health/dashConvert)              # Convert health to dash count
    remainingHealth = healthDashes - currentDashes       # Get the health remaining to fill as space 

    healthDisplay = '-' * currentDashes                  # Convert 8 to 8 dashes as a string:   "--------"
    remainingDisplay = ' ' * remainingHealth             # Convert 12 to 12 spaces as a string: "            "
    percent = ((health/maxHealth)*100)      # Get the percent as a whole number:   40%
    puts ""
    # return ("          |" + healthDisplay + remainingDisplay + "|") + percent  # Print out textbased healthbar
    # puts "                            #{percent}%"    
    return healthDisplay, remainingDisplay, percent
  end  
  
  #puts the healthbar and enemy image
  def monster_health
    puts enemy_fight 
    enemy_health, tes, enemy_percent = do_health(@enemy.enemy_max_health,@enemy.enemy_health_points)
    player_health,tes2, player_percent = do_health(@player.max_health_points,@player.health_points)
    puts  ("|" + player_health + tes2 + "|") + ("    \t\t\t\t\t      |" + enemy_health + tes + "|") 
    puts "\t\t#{player_percent}% \t\t\t\t\t\t\t\t\t\t\t #{enemy_percent}% " 

  end
end