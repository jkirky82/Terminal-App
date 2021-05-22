require "tty-prompt"
class Path
    @@prompt = TTY::Prompt.new

    def three_path
        ['combat','combat','treasure']
        @@prompt.select("What path do you choose", %w(Left Middle Right), max: 1)
        return ['combat','combat','treasure'].sample
    end

    def treasure(level, player)
        random_select = [1,1,1,2,2,3]
        case random_select.samplecase rand(1..3)
        when 1 
            rest_place(player)
        when 2
            restor_pp(player)
        when 3 
            special_item(level, player)
        end
    end

    def rest_place(player)
        puts "Take a rest wanderer"
        player.health_points += player.health_points * 0.3
        puts "After resting you gained #{player.health_points + (player.health_points * 0.3)} health"
    end

    def restor_pp (player)
        puts "You find a weird berry, you eat it something odd happens"
        chosen_spell = @@prompt.select("Select spell that youd like to restor energy too", max: 1) do |menu|
            @player.abilitys.each do |spells| 
              menu.choice spells[:title]
            end
        end
        @player.abilitys.each do |spells| 
            if spells[:title] == chosen_spell
                puts "#{spell[:title]} energy restored to #{spell[:pp_max]}"
                spell[:pp] = spell[:pp_max]
            end
        end

    end

    def special_item (level, player)
        puts "A secret path has been found "
    end
end