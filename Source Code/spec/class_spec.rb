require '../main.rb'



describe "character age" do 
  it "The character age is a number" do
  expect(age_validator(10)).to be(10)
  end
  it "If user inputs not a number" do
    expect{age_validator('4')}.to raise_error(NotANumber) 
   end
end
