# 6. 計算有幾個母音字母(a, e, i, o, u)

# L7-006 計算有幾個母音字母(a, e, i, o, u)

def vowel_count(string)
  # string.chars.select { |n| n == 'a' || n == 'e' || n == 'i' || n == 'o' || n == 'u'}.count
  string.count('aeiou')
end

# p vowel_count("abracadabra")

RSpec.describe do
  it "計算有幾個母音字母" do
    expect(vowel_count("abracadabra")).to be 5
    expect(vowel_count("5xruby")).to be 1
    expect(vowel_count("iloveyou")).to be 5
  end
end