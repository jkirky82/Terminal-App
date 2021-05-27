
require_relative '../path.rb'
require_relative '../character/weapon.rb'



describe "Chosen Path" do 
  path = Path.new
  it "Random generates what path the player goes" do
    expect(path.three_path).to eq('combat').or eq('treasure')
  end
end

describe "Character weapon selector" do 
  weapon = Weapon.new
  it "Player selects what weapon they would like" do
    expect(weapon.water_weapons).to eq({:name => 'Bow', :dmg => 30}).or eq({:name => 'Spear', :dmg => 30})
  end
end
