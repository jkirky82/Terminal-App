require_relative '../main.rb'



describe "character customise" do 
  character = Character.new('Jack', 18)
  it "Input the characters name" do
    expect(character.name).to eq('Jack')
  end

  it "Input the characters age" do
    expect(character.age).to be(18)
  end
end
