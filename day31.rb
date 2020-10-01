def spinWords(string)
  # 先拆成字串
  # 判斷個別長度，大於等於5的就要 reverse
  string.split(" ").map { |s| s.length >= 5 ? s.reverse : s }.join(" ")
end


RSpec.describe "Stop gninnipS My sdroW!" do
  it "Example cases" do
    expect(spinWords("Hey fellow warriors")).to eq("Hey wollef sroirraw")
  end
end