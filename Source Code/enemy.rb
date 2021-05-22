require_relative 'combat.rb'

class Enemy
    attr_accessor :enemy_health_points
    attr_reader :enemy_armor_score, :enemy_attack
    def initialize(level)
        @enemy_armor_score  = 14
        @enemy_attack = 6
    end
    def Brute(level)
        @enemy_health_points = rand(20..30)*level
        @enemy_attack = 6*level
    end 
    
    def Mage(level)
        @enemy_health_points = rand(10..20)*level
        @enemy_attack = 2*level
    end

    def monk(level)
        @enemy_health_points = rand(15..25)*level
        @enemy_attack = 4*level
    end

end