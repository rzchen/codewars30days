# 3. 找出缺少的數字，例如 [-3, -2, 1, 5] 少了 -1、0、2、3、4 這幾個數字。

# L7-003 找出缺少的數字，例如 `[-3, -2, 1, 5]` 少了 -1、0、2、3、4 這幾個數字。

def find_missing_numbers(array)
  # if array.any?
  #   (array[0]..array[-1]).to_a - array
  # else
  #   []
  # end
  if array.length < 2
    []
  else
    [*array.min..array.max] - array
  end
end

RSpec.describe do
  it "找出缺少的數字" do
    expect(find_missing_numbers([-3,-2,1,4])).to eq [-1,0,2,3]
    expect(find_missing_numbers([-1,0,1,2,3,4])).to eq []
    expect(find_missing_numbers([])).to eq []
    expect(find_missing_numbers([0])).to eq []
    expect(find_missing_numbers([-4,4])).to eq [-3,-2,-1,0,1,2,3]
  end
end
