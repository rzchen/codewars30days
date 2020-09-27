def tickets(people)
  # 分兩個 count： counter_25, counter_50 當其中一個小於0就是 NO，不然就是 YES
  # 收 25 時，counter_25 +1
  # 收 50 時，counter_25 -1
  # 收 100 時，counter_25 -3 || counter_25 -1 && counter_50 -1
  counter_25, counter_50 = 0, 0
  people.each do |pay|
    counter_25 += 1 if pay == 25
    
    if pay == 50
      counter_25 -= 1
      counter_50 += 1
    end
    
    if pay == 100
      if counter_25 >= 3
        counter_25 -= 3 
      else
        counter_25 -= 1
        counter_50 -= 1
      end
    end
  end

  if counter_25 < 0 || counter_50 < 0
    'NO'
  else
    'YES'
  end
end

RSpec.describe "Vasya - Clerk" do
  it "ticket" do
    expect(tickets([25, 25, 50])).to eq('YES')
    expect(tickets([25, 100])).to eq('NO')
    expect(tickets([50, 100, 100])).to eq('NO')
  end
end