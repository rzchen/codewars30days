# L7-014 調整以下實作，讓程式可順利執行

class Human
  # def initialize(my_name)
  #   @my_name = my_name
  # end

  # def greet(your_name)
  #   "Hello #{your_name}, my name is #{@my_name}"
  # end
  
  # def name
  #   @my_name
  # end
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def greet(your_name)
    "Hello #{your_name}, my name is #{@name}"
  end

end



RSpec.describe do
  it "打招呼！" do
    jack = Human.new("Jack")
    jill = Human.new("Jill")

    expect(jack.greet("Jill")).to eq "Hello Jill, my name is Jack"
    expect(jack.greet("Mary")).to eq "Hello Mary, my name is Jack"
    expect(jill.greet("Jack")).to eq "Hello Jack, my name is Jill"
    expect(jill.name).to eq 'Jill'
  end
end