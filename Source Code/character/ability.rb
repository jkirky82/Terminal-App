require_relative 'class.rb'
class Ability

  def ability(chosen_list)
    ability_list = []
    for i in chosen_list
      if i == "Wall of Water"
        ability_list << {:title => i, :dmg => 100, :pp => 2, :pp_max => 2, :type => 'water'}
      elsif i == 'Splash'
        ability_list << {:title => i, :dmg => 40, :pp => 5, :pp_max => 5, :type => 'water'}
      elsif i == 'Water Shield'
        ability_list << {:title => i, :dmg => 0, :pp => 4, :pp_max => 4, :type => 'water'}
      elsif i == 'Tidal Wave'
        ability_list << {:title => i, :dmg => 150, :pp => 1, :pp_max => 1, :type => 'water'}
      end 
    end

    return ability_list
  end
end