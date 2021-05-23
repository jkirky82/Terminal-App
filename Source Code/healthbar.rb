
def do_health
    health = 234.0      # Current Health (float so division doesn't make an int)
    maxHealth = 234.0   # Max Health
    healthDashes = 20 # Max Displayed dashes
  dashConvert = (maxHealth/healthDashes)            # Get the number to divide by to convert health to dashes (being 10)
  currentDashes = (health/dashConvert)              # Convert health to dash count: 80/10 => 8 dashes
  remainingHealth = healthDashes - currentDashes       # Get the health remaining to fill as space => 12 spaces

puts dashConvert
puts currentDashes

  healthDisplay = '-' * currentDashes   
  puts remainingHealth                # Convert 8 to 8 dashes as a string:   "--------"
  remainingDisplay = ' ' * remainingHealth             # Convert 12 to 12 spaces as a string: "            "
  percent = ((health/maxHealth)*100)      # Get the percent as a whole number:   40%

  puts("|" + healthDisplay + remainingDisplay + "|")  # Print out textbased healthbar
  puts "               #{percent}%"    
end     
do_health

puts "
                                        ,--,  ,.-.
               ,                   \\,       '-,-`,'-.' | ._
              /|           \\    ,   |\\        }  )/  / `-,',
              [ ,          |\  /|   | |        /  \\|  |/`  ,`
              | |       ,.`  `,` `, | |  _,...(   (      .',
              \\  \\  __ ,-` `  ,  , `/ |,'      Y     (   /_L\

               \\  \\_\\,``,   ` , ,  /  |         )         _,/
                \\  '  `  ,_ _`_,-,<._.<        /         /
                 ', `>.,`  `  `   ,., |_      |         /
                 \\/`  `,   `   ,`  | /__,.-`    _,   `\

               -,-..\\  _  \\  `  /  ,  / `._) _,-\\`       \

                \_,,.) /\\    ` /  / ) (-,, ``    ,        |
               ,` )  | \\_\\       '-`  |  `(               \
               
              /  /```(   , --, ,' \\   |`<`    ,            |
             /  /_,--`\\   <\  V /> ,` )<_/)  | \\      _____)
       ,-, ,`   `   (_,\\ \\    |   /) / __/  /   `----`
      (-, \\           ) \\ ('_.-._)/ /,`    /
      | /  `          `/ \\\\ V   V, /`     /
   ,--\\(        ,     <_/`\\\\     ||      /
  (   ,``-     \\/|         \\-A.A-`|     /
 ,>,_ )_,..(    )\\          -,,_-`  _--`
(_ \\|`   _,/_  /  \\_            ,--`
 \\( `   <.,../`     `-.._   _,-`"