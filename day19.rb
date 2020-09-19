# L7-012 實作以下內容

# 把 code 寫在這兒！
class Person
  # def initialize(*name)
  #   @name = name.join(" ")
  # end
  # def greet
  #   "Hello, #{@name}!"
  # end
  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end
  def greet
    "Hello, #{@first_name} #{@last_name}!"
  end
end

RSpec.describe do
  it "當個有禮貌的人" do
    person = Person.new('Bob', 'Smith')
    expect(person.greet).to eq 'Hello, Bob Smith!'
  end
end
