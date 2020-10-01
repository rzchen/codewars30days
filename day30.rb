def rgb(r, g, b)
  result = ""
  arr = [r, g, b]

  arr.map { |a| a >= 255 ? a = 255 : a }
     .map { |a| a <= 0 ? a = 0 : a }
     .each do |n|
          result += n.to_s(16).length == 1 ? "0" + n.to_s(16).upcase : n.to_s(16).upcase
        end

  result

  # "%.2X%.2X%.2X" % [r,g,b].map{|i| [[i,255].min,0].max}
end

RSpec.describe "RGB To Hex Conversion" do
  it "Example cases" do
    expect(rgb(0, 0, 0)).to eq('000000')
    expect(rgb(0, 0, -20)).to eq('000000')
    expect(rgb(300,255,255)).to eq('FFFFFF')
    expect(rgb(173,255,47)).to eq('ADFF2F')
  end
end