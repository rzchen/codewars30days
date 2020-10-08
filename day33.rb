def longest_palindrome s
  # s.chars.group_by { |n| s.chars.count(n) }.max_by { |k,v| k}[1].length
end

RSpec.describe "longest_palindrome" do
  it "Example cases" do
    expect(longest_palindrome("a")).to eq(1)
    expect(longest_palindrome("aa")).to eq(2)
    expect(longest_palindrome("baa")).to eq(2)
    expect(longest_palindrome("aab")).to eq(2)
    expect(longest_palindrome("baabcd")).to eq(4)
    expect(longest_palindrome("baablkj12345432133d")).to eq(9)
  end
end