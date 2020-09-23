# You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block for each letter (direction) and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.
# 翻譯：總之最多只能走10個街區，且相鄰不能是同樣的街區名稱


def is_valid_walk(walk)
  count = 0
  return "should return false" if walk.length != 10
  walk.each.with_index do |w, i|
    count += 1 if w == walk[i+1]
  end
  return "should return false" if count > 0
  "should return true"
end

RSpec.describe do
  it "計算不重複元素的總合" do
    expect(is_valid_walk(['n','s','n','s','n','s','n','s','n','s'])).to eq('should return true')
    expect(!is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e'])).to eq('should return false')
    expect(!is_valid_walk(['w'])).to eq('should return false')
    expect(!is_valid_walk(['n','n','n','s','n','s','n','s','n','s'])).to eq('should return false')
  end
end