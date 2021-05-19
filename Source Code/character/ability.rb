require_relative 'class.rb'
class Ability

  def ability(chosen_list)
    ability_list = []
    for i in chosen_list
      if i == "Wall of Water"
        ability_list << {:title => i, :dmg => 10, :type => 'water'}
      elsif i == 'Splash'
        ability_list << {:title => i, :dmg => 6, :type => 'water'}
      elsif i == 'Water Shield'
        ability_list << {:title => i, :dmg => 0, :type => 'water'}
      elsif i == 'Tidal Wave'
        ability_list << {:title => i, :dmg => 15, :type => 'water'}
      end 
    end

    return ability_list
  end
end