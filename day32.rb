def pig_it text
  text.split.map { |n| n =~ /[[:punct:]]/ ? n : n[1..-1] + n[0] + "ay" }.join(" ")
end

RSpec.describe "Simple Pig Latin" do
  it "Example cases" do
    expect(pig_it('Pig latin is cool')).to eq('igPay atinlay siay oolcay')
    expect(pig_it('This is my string')).to eq('hisTay siay ymay tringsay')
  end
end