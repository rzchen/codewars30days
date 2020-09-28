def expanded_form(num)
  # input 的數字拆成一個個字元放入陣列
  # [1, 2] -> a[0]+ '0' * (a.length -1), a[1]+ '0' * (a.length - 2)
  # 最後再組合起來

  num.to_s
     .split("")
     .map
     .with_index { |n, i| n + '0' * (num.to_s.length - i - 1)}
     .select { |n| n.to_i != 0 }
     .join(" + ")

  # num.to_s
  #    .chars
  #    .reverse
  #    .map.with_index { |d, idx| d.to_i * 10**idx }
  #    .reject(&:zero?)
  #    .reverse
  #    .join (' + ')
end

RSpec.describe "Write Number in Expanded Form" do
  it "Example cases" do
    expect(expanded_form(12)).to eq('10 + 2')
    expect(expanded_form(42)).to eq('40 + 2')
    expect(expanded_form(70304)).to eq('70000 + 300 + 4')
  end
end