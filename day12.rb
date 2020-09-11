# 5. 一夥人去吃飯，大家先各自付帳，待後續再計算多退少補，請根據輸出結果完成以下實作。

# L7-005 一夥人去吃飯，大家先各自付帳，待後續再計算多退少補，請根據輸出結果完成以下實作。

def split_the_bill(bill)
  # avg_pay = bill.values.sum / 3
  # bill.map { |k, v| [k, ("%.1f" % (v - avg_pay)).to_i] }.to_h
  avg = bill.values.sum / bill.count.to_f
  bill.transform_values { |v| v - avg }
end

# p split_the_bill('A' => 20, 'B' => 15, 'C' => 10)

RSpec.describe do
  it "帳單計算" do
    expect(split_the_bill('A' => 20, 'B' => 15, 'C' => 10)).to eq({'A' => 5.00, 'B' => 0.00, 'C' => -5.00})
    expect(split_the_bill('A' => 40, 'B' => 25, 'X' => 10)).to eq({'A' => 15.00, 'B' => 0.00, 'X' => -15.00})
  end
end