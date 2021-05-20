require_relative 'combat.rb'

class Enemy
    attr_accessor :enemy_health_points
    attr_reader :enemy_armor_score, :enemy_attack
    def initialize
        @enemy_health_points = 20
        @enemy_armor_score  = 14
        @enemy_attack = 6
    end
end