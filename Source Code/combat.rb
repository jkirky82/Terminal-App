require_relative 'enemy.rb'
require "tty-prompt"

class Combat 
  @@prompt = TTY::Prompt.new

  def initialize(tes, level)
    #Some text before combat
    system("clear") #clears the terminal
    puts "whats that sounds"
    sleep(1)
    system("clear")

    @player = tes
    @enemy = Enemy.new(1)
    puts "An angry looking #{@enemy.enemy_type} approach" #change text size 
    rounds
  end

  def rounds
    drawing
    do_health(@enemy.enemy_max_health,@enemy.enemy_health_points)
    while @enemy.enemy_health_points > 0 
      puts ""
      case @@prompt.select("Your move, What will it be", %w(Attack Spells Potion), max: 1)
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
      return if enemy_life == true
    else
      puts "Missed"
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
      end
      #loops through and checks chosen answer and uses the dmg part of the array to deal damage to enemy
      @player.abilitys.each do |spells| 
        if spells[:title] == chosen_spell
          if spells[:pp] == 0
            puts "You dont have enough enegery to cast that spell anymore"
          else
            @enemy.enemy_health_points -= spells[:dmg]
            spells[:pp] -= 1
            spell_pp = true
            return if enemy_life == true
          end
        end
      end
    end
    enemy_turn
  end

  #players potion options 
  def potion 
  end

  def enemy_life
    puts @enemy.enemy_health_points
    if @enemy.enemy_health_points <= 0 
      puts "You won the fight"
      return true
    end
  end

  #enemy turn attack 
  def enemy_turn
    puts "The #{@enemy.enemy_type} goes for an attack"
    if rand(1..20) + 2 <= 16 #player armor class
    end
    if @player.health_points == 0
      puts "you died game over"
      exit!
    end  
  end

  def do_health(maxHealth,health)
    health = health.to_f
    maxHealth = maxHealth.to_f
    if health < 0 
      health = 0
    end
    healthDashes = 40 # Max Displayed dashes
    dashConvert = (maxHealth/healthDashes)            # Get the number to divide by to convert health to dashes (being 10)
    currentDashes = (health/dashConvert)              # Convert health to dash count: 80/10 => 8 dashes
    remainingHealth = healthDashes - currentDashes       # Get the health remaining to fill as space => 12 spaces

    healthDisplay = '-' * currentDashes                  # Convert 8 to 8 dashes as a string:   "--------"
    remainingDisplay = ' ' * remainingHealth             # Convert 12 to 12 spaces as a string: "            "
    percent = ((health/maxHealth)*100)      # Get the percent as a whole number:   40%

    puts ""
    puts("          |" + healthDisplay + remainingDisplay + "|")  # Print out textbased healthbar
    puts "                          #{percent}%"    
  end    

  def drawing
    puts "
                                        ,--,  ,.-.
               ,                   \\,       '-,-`,'-.' | ._
              /|           \\    ,   |\\        }  )/  / `-,',
              [ ,          |\  /|   | |        /  \\|  |/`  ,`
              | |       ,.`  `,` `, | |  _,...(   (      .',
              \\  \\  __ ,-` `  ,  , `/ |,'      Y     (   /_L\

               \\  \\_\\,``,   ` , ,  /  |         )         _,/
                \\  '  `  ,_ _`_,-,<._.<        /         /
                 ', `>.,`  `  `   ,., |_      |         /
                 \\/`  `,   `   ,`  | /__,.-`    _,   `\

               -,-..\\  _  \\  `  /  ,  / `._) _,-\\`       \

                \_,,.) /\\    ` /  / ) (-,, ``    ,        |
               ,` )  | \\_\\       '-`  |  `(               \
               
              /  /```(   , --, ,' \\   |`<`    ,            |
             /  /_,--`\\   <\  V /> ,` )<_/)  | \\      _____)
       ,-, ,`   `   (_,\\ \\    |   /) / __/  /   `----`
      (-, \\           ) \\ ('_.-._)/ /,`    /
      | /  `          `/ \\\\ V   V, /`     /
   ,--\\(        ,     <_/`\\\\     ||      /
  (   ,``-     \\/|         \\-A.A-`|     /
 ,>,_ )_,..(    )\\          -,,_-`  _--`
(_ \\|`   _,/_  /  \\_            ,--`
 \\( `   <.,../`     `-.._   _,-`"
  end
end