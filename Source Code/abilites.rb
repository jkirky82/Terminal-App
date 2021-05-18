require_relative 'class.rb'
class Abilities

  def abilities(chosen_list)
    abilite_list = []
    for i in chosen_list
      if i == "Wall of Water"
        abilite_list << {:title => i, :dmg => 10, :type => 'water'}
      elsif i == 'Splash'
        abilite_list << {:title => i, :dmg => 6, :type => 'water'}
      elsif i == 'Water Shield'
        abilite_list << {:title => i, :dmg => 0, :type => 'water'}
      elsif i == 'Tidal Wave'
        abilite_list << {:title => i, :dmg => 15, :type => 'water'}
      end 
    end

    return abilite_list
  end
end