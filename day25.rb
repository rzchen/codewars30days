def in_array(array1, array2)
  result = []
  array2.each do |a2|
    array1.each do |a1|
      if a2.include? a1
        result << a1
      end
    end
  end
  result.uniq.sort
end


#     a1 = ["arp", "live", "strong"]
#     a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

# p in_array(a1, a2)


RSpec.describe do
  it "test1" do
    a1 = ["arp", "live", "strong"]
    a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
    expect(in_array(a1, a2)).to eq(["arp", "live", "strong"])
  end
  it "test2" do
    a1 = ["tarp", "mice", "bull"]
    a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
    expect(in_array(a1, a2)).to eq([])
  end
end