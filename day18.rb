# L7-011 檢查是否有照順序排？

def is_sorted_and_how(arr)
  # asc = arr.sort
  # des = arr.sort.reverse
  # return 'no' if (arr != asc) && (arr != des)
  # return 'yes, ascending' if (arr == asc)
  # 'yes, descending'
  # if (arr != asc) && (arr != des)
  #   'no'
  # else
  #   if (arr == asc)
  #     'yes, ascending'
  #   else
  #     'yes, descending'
  #   end
  # end

  case arr
  when arr.sort
    'yes, ascending'
  when arr.sort.reverse
    'yes, descending'
  else
    'no'
  end
end

RSpec.describe do
  it "檢查是否有照順序排？" do
    expect(is_sorted_and_how([1, 2])).to eq 'yes, ascending'
    expect(is_sorted_and_how([15, 7, 3, -8])).to eq 'yes, descending'
    expect(is_sorted_and_how([4, 2, 30])).to eq 'no'
  end
end



def is_sorted_and_how(arr)
  # asc = arr.sort
  # des = arr.sort.reverse
  return 'no' if (arr != asc) && (arr != des)
  return 'yes, ascending' if (arr == asc)
  'yes, descending'
end