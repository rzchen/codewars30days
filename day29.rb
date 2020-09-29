# https://www.codewars.com/kata/5202ef17a402dd033c000009/train/ruby

def title_case(title, minor_words = '')
  return '' if title == ''
  return title.split(" ").map(&:capitalize).join(" ") if title.length != 0 && minor_words == ''

  if minor_words.length != 0
    minor = minor_words.split(" ").map(&:capitalize)
  end

  result = title.split(" ").map(&:capitalize).map do |t|
             minor.each do |m|
               if t == m
                t = t.downcase
                break
               end
             end
             t
           end
  result[0] = result[0].capitalize
  result.join(" ")
end

RSpec.describe "Title Case" do
  it "Example cases" do
    expect(title_case('')).to eq('')
    expect(title_case('a clash of KINGS', 'a an the of')).to eq('A Clash of Kings')
    expect(title_case('THE WIND IN THE WILLOWS', 'The In')).to eq('The Wind in the Willows')
    expect(title_case('the quick brown fox')).to eq('The Quick Brown Fox')
  end
end