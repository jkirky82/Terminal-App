require_relative 'combat.rb'

class Enemy
    attr_accessor :enemy_health_points, :enemy_max_health
    attr_reader :enemy_armor_score, :enemy_attack, :enemy_type

    #Choose a random enemy and sends the level the player is up to
    def initialize(level)
        case rand(1..3)     #chooses a random number 1,2 or 3
        when 1 
            brute(level)
        when 2
            mage(level)
        when 3 
            monk(level)
        end
        
    end

    #Creates a brute enemy and will get increased stats based on the level
    def brute(level)
        @enemy_type = "Brute"
        @enemy_health_points = rand(200..300)*level
        @enemy_max_health = @enemy_health_points
        @enemy_attack = 60*level
        @enemy_armor_score  = 13
    end 
    
    #Creates a mage enemy and will get increased stats based on the level
    def mage(level)
        @enemy_type = "Mage"
        @enemy_health_points = rand(100..200)*level
        @enemy_max_health = @enemy_health_points
        @enemy_attack = 20*level
        @enemy_armor_score  = 11
    end

    #Creates a monk enemy and will get increased stats based on the level
    def monk(level)
        @enemy_type = "Monk"
        @enemy_health_points = rand(150..250)*level
        @enemy_max_health = @enemy_health_points
        @enemy_attack = 40*level
        @enemy_armor_score  = 12 + level
    end

end