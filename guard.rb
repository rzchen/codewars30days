# # 只有 if(原)
# def check_a_eq_1
#   a = 1
#   if a == 1
#     "a 是 1"
#   end
# end

# # 只有 if(減)
# def check_a_eq_1
#   a = 1
#   return "a 是 1" if a == 1
# end

# if/else(原)
# def check_a_eq_1
#   a = 1
#   if a == 1
#     "a 是 1"
#   else
#     "a 不是 1"
#   end
# end

# if/else(guard)
def check_a_eq_1
  a = 1
  return "a 是 1" if a == 1
  "a 不是 1"
end

puts check_a_eq_1()

# if a == 1
#   puts "a 是 1"
# end

# puts "a 是 1" if a == 1

# if a = 1
#   "a 是 1"
# else
#   "a 不是 1"
# end






# puts "a 是 1" if a == 1
# puts "a 不是 1"