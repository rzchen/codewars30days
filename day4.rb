# 28. 請計算在幾年後，爸爸的年紀是兒子的二倍？

def twice_as_old(father, son)
  # result = 0
  # while father != (son * 2)
  #   father += 1
  #   son += 1
  #   result += 1
  # end
  # result
  father - 2 * son
end

puts twice_as_old(36,7)   # 22
puts twice_as_old(65,30)  # 5
puts twice_as_old(42,21)  # 0
puts twice_as_old(22,1)   # 20
puts twice_as_old(29,0)   # 29