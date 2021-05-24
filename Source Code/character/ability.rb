require_relative 'class.rb'
class Ability
  #Gets the user selected abilites and stores them in and hash inside an array
  def ability(chosen_list)
    ability_list = []
    for i in chosen_list
      if i == "Wall of Water"
        ability_list << {:title => i, :dmg => 100, :pp => 2, :pp_max => 2, :type => 'Water'}    #The hash has the title, abilite damage, abilite uses (pp)
      elsif i == 'Splash'
        ability_list << {:title => i, :dmg => 40, :pp => 5, :pp_max => 5, :type => 'Water'}     #pp_max is used to restore the pp to max if used up ad they find the right treasure room
      elsif i == 'Water Shield'
        ability_list << {:title => i, :dmg => 0, :pp => 4, :pp_max => 4, :type => 'Water'}      #And the type for effectiveness
      elsif i == 'Tidal Wave'
        ability_list << {:title => i, :dmg => 150, :pp => 1, :pp_max => 1, :type => 'Water'}
      end 
    end
    return ability_list
  end
end