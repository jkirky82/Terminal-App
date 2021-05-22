require_relative 'combat.rb'

class Enemy
    attr_accessor :enemy_health_points
    attr_reader :enemy_armor_score, :enemy_attack, :enemy_type
    def initialize(level)
        case rand(1..3)
        when 1 
            brute(level)
        when 2
            mage(level)
        when 3 
            monk(level)
        end
        
    end
    def brute(level)
        @enemy_type = "Brute"
        @enemy_health_points = rand(20..30)*level
        @enemy_attack = 6*level
        @enemy_armor_score  = 13
    end 
    
    def mage(level)
        @enemy_type = "Mage"
        @enemy_health_points = rand(10..20)*level
        @enemy_attack = 2*level
        @enemy_armor_score  = 11
    end

    def monk(level)
        @enemy_type = "Monk"
        @enemy_health_points = rand(15..25)*level
        @enemy_attack = 4*level
        @enemy_armor_score  = 12 + level
    end

end