# L7-010 幫信用卡號打馬賽克

def maskify(card_number)
  # if card_number.length < 5
  #   card_number
  # else
  #   last_four = card_number[-4..-1]
  #   head = card_number[0..-5]
  #   head = head.chars.map { |n| n = "#" }.join("")
  #   "#{head}#{last_four}"
  # end
  # len = card_number.length
  # if len < 5
  #   card_number
  # else
  #   last_four = card_number[-4, 4]
  #   "#{ "#" * (len - 4) }#{ card_number[-4, 4] }"
  # end
  card_number.gsub(/.(?=....)/, "#")
end

RSpec.describe do
  it "幫信用卡號打馬賽克" do
    expect(maskify('4556364607935616')).to eq '############5616'
    expect(maskify('1')).to eq '1'
    expect(maskify('11111')).to eq '#1111'
  end
end