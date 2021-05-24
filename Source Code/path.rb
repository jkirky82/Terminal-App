require "tty-prompt"
class Path
    @@prompt = TTY::Prompt.new

    def three_path
        @@prompt.select("What path do you choose", %w(Left Middle Right), max: 1)
        return ['combat','treasure','treasure'].sample
    end

    def treasure(player)
       
        case [1,1,1,2,2,3].sample
        when 1 
            rest_place(player)
        when 2
            restor_pp(player)
        when 3 
            special_item(player)
        end
    end

    def rest_place(player)
        puts "Take a rest wanderer"
        puts "After resting you gained #{(player.health_points * 0.3)} health"
        player.health_points += player.health_points * 0.3
        sleep(10)
    end

    def restor_pp(player)
        puts "You find a weird berry, you eat it something odd happens"
        chosen_spell = @@prompt.select("Select spell that youd like to restor energy too") do |menu|
            player.abilitys.each do |spells| 
              menu.choice spells[:title]
            end
        end
        player.abilitys.each do |spells| 
            if spells[:title] == chosen_spell
                puts "#{spells[:title]} energy restored to #{spells[:pp_max]}"
                spells[:pp] = spells[:pp_max]
                sleep(2)
            end
        end

    end

    def special_item(player)
        puts "A secret path has been found"
        puts "After walking down the path for a while you hear a loud thumping sounds"
        case @@prompt.select("Do you continue on?", %w(Yes No)) 
        when 'Yes'
        when 'No'
        end
    end
end