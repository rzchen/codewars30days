# =================================================================

# 4-1. 完成以下產生訂單編號程式之實作內容：

def generate_odd_numbers(n)
    (1..n).select { |num| num.odd? }
end

p generate_odd_numbers(7)  # 印出 [1, 3, 5, 7]
p generate_odd_numbers(15) # 印出 [1, 3, 5, 7, 9, 11, 13, 15]
p generate_odd_numbers(8)  # 印出 [1, 3, 5, 7]
p generate_odd_numbers(6)  # 印出 [1, 3, 5]
p generate_odd_numbers(3)  # 印出 [1, 3]

# =================================================================

# 4-2. 完成以下計算圓面積程式的實作內容：

def calc_area(radius)
  if radius > 0
    (Math::PI * radius * radius).round(2)
  else
    "Radius must greater than zero!"
  end
end

puts calc_area(8)   # 印出 201.06
puts calc_area(10)  # 印出 314.16
puts calc_area(15)  # 印出 706.86
puts calc_area(-1)  # 印出 Radius must greater than zero!

# =================================================================

# 4-3. 完成以下產生訂單編號程式之實作內容：

def generate_order_code(str)
  serial = "%07d" % str
  "TN-#{ serial }"
  # 或是
  # "TN-" + ("%07d" % str)
end

puts generate_order_code(29)    # 印出 TN-0000029
puts generate_order_code(328)   # 印出 TN-0000328
puts generate_order_code(1224)  # 印出 TN-0001224

# =================================================================

# 4-4. 本期學生的成績如附檔(score.csv)，其中第 1 欄是學生姓名，其它 5 個欄位是學生的 5 次成績。請試著寫一段程式計算每位同學的平均分數，並在畫面上印出以下結果：

# John: 78.0
# Mary: 76.2
# Sherly: 90.8
# Joanne: 78.2
# 注意格式以及大小寫

File.readlines('score.csv').each do |line|
    data = line.split(',')
    average = data[1..5].map { |x| x.to_i }.sum / 5.0
    puts "#{ data.first.capitalize}: #{ average}"
end

# =================================================================

# 5-1. 有一個程式語言的名單如下：

# language = ['PHP', 'Python', 'Ruby', 'Perl', 'ASP', 'ActionScript', 'Objective-C', 'Swift', 'Kotlin', 'Go']

# (1) 請寫一段程式，印出 P 開頭的程式語言

language = ['PHP', 'Python', 'Ruby', 'Perl', 'ASP', 'ActionScript', 'Objective-C', 'Swift', 'Kotlin', 'Go']

p language.select { |lang| lang[0] == "P"}
# 其他方法
# p language.select { |lang| lang.start_with?("P") }
# 其他方法
# p language.min { |a, b| a.length <=> b.length}

# (2) 找出名字最短的程式名語

language = ['PHP', 'Python', 'Ruby', 'Perl', 'ASP', 'ActionScript', 'Objective-C', 'Swift', 'Kotlin', 'Go']

p language.sort_by { |lang| lang.length }[0]
# 其他方法
# p language.min { |a, b| a.length <=> b.length}

# =================================================================

# 5-2. 完成下列功能

require 'date'

def calc_age(birthday)
    ((Date.today - Date.parse(birthday)).to_i / 365.0).ceil

end
  
puts calc_age('1985/1/2')  # 印出 35
puts calc_age('1997/8/28') # 印出 22

# =================================================================

# 5-3. 台灣公司的統一編號跟身份證字號一樣都是有規則的：共八位數字

# 各數字分別乘以 1,2,1,2,1,2,4,1
# 例：統一編號為 53212539
# 先將統編每位數乘以一個固定數字固定值

#   5   3   2   1   2   5   3   9
# x 1   2   1   2   1   2   4   1
# ================================
#   5   6   2   2   2  10  12   9


# 接著將所得值分成十位數及個位數十位數 個位數

#  十位數 個位數
#   0      5
#   0      6
#   0      2
#   0      2
#   0      2
#   1      0
#   1      2
#   0      9


# 將十位數與個位數全部結果值加總

# 判斷結果

# 第一種: 加總之後的值可以被 10 整除即是正確的統編。
# 第二種: 或是，如果統編的第 7 碼是 7 的話，再把總值加 1 之後可 10 整除也是正確的統編。

def is_valid_company_no?(serial)
  if serial.length != 8
      "格式不符"
  else
      check_params = [1,2,1,2,1,2,4,1]

      checksum = 0
      serial.split("").each.with_index do |s, index|
          checksum += (s.to_i * check_params[index]).divmod(10).sum
          
      end

      if (checksum % 10 == 0) || (serial[6] == '7' && (checksum + 1) % 10 == 0)
          true
      else
          false
      end

      # 甚至可以直接寫成以下就好
      # (checksum % 10 == 0) || (serial[6] == '7' && (checksum + 1) % 10 == 0)
  end
end

p is_valid_company_no?('2453680')  # 印出「格式不符」字樣
p is_valid_company_no?('24536806') # 印出 true
p is_valid_company_no?('12222539') # 印出 false

# =================================================================

# 6-1.完成以下實作內容：

def calc_sum(param)
  if param.class == Array
    param.sum
  elsif param.class == Integer
    param
  else
    0
  end
end

puts calc_sum([1, 2, 3, 4, 5])  # 印出 15
puts calc_sum(5)                # 印出 5
puts calc_sum(nil)              # 印出 0


# 另種判斷式寫法
# if param.is_a?(Array)
# if param.kind_of?(Array)
# if param.is_a? Array

# 也可以用 case when 內建 class 直接寫成以下
# case param
# when Array
# when Integer

# ===== 以下龍哥開大絕 =====
# Array 產生的方法有以下三種
# (1) [] (2) Array.new (3) Array([1,2,3]) -> [1,2,3]  or  Array(2) -> [2]  or Array(nil) -> [0]
# 剛好可以直接用第三種來解，如下

# def calc_sum(param)
#     Array(param).sum
# end
  
# puts calc_sum([1, 2, 3, 4, 5])  # 印出 15
# puts calc_sum(5)                # 印出 5
# puts calc_sum(nil)              # 印出 0

# =================================================================

# 6-2.請想辦法讓以下程式可正常執行：
# 這題重點：開放類別

class String
  def greeting!
      "Hello, #{ self.capitalize }"
  end
end

puts "kitty".greeting!  # 印出 Hello, Kitty

# =================================================================

# 6-3.請配合 faker 這個 gem，完成以下 Rake 程式：

# $ rake -T
# rake profile:generate  # 隨機產生三組個人資料

# $ rake profile:generate
# Joella Lynch <benedict_murphy@feesthowell.com>
# Mr. Hollis Kassulke <cherish.wilderman@hahntorphy.io>
# Linwood Schmidt <napoleon@kuhic.net>

require 'faker'
desc "隨機產生三組個人資料"

namespace :profile do
    task :generate do
        3.times { puts "#{Faker::Name.name} <#{Faker::Internet.email}>" }
    end
end


# codewars # codewars# codewars# codewars# codewars# codewars# codewars# codewars
# codewars # codewars# codewars# codewars# codewars# codewars# codewars# codewars
# codewars # codewars# codewars# codewars# codewars# codewars# codewars# codewars
# codewars # codewars# codewars# codewars# codewars# codewars# codewars# codewars
# codewars # codewars# codewars# codewars# codewars# codewars# codewars# codewars
# codewars # codewars# codewars# codewars# codewars# codewars# codewars# codewars

# =================================================================

# 1.完成以下實作

def count_by(x, n)
  (1..n).to_a.map { |num| num * x }
end

p count_by(1, 5)    # [1, 2, 3, 4, 5]
p count_by(2, 5)    # [2, 4, 6, 8, 10]
p count_by(3, 5)    # [3, 6, 9, 12, 15]
p count_by(50, 5)   # [50, 100, 150, 200, 250]
p count_by(100, 5)  # [100, 200, 300, 400, 500]

# =================================================================

# 2.把 "a" 字串換成 1，"b" 字串換成 2，不是英文字母的話就無視它，依此類推。請完成以下實作內容：

def alphabet_position(text)
  text.gsub( /\W/ ,"").downcase.bytes.map { |word| word - 96 }.join(" ")
end


p alphabet_position("The sunset sets at twelve o' clock.")
# 印出 "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" 字串

p alphabet_position("-.-'")
# 印出 "" 空字串

# =================================================================

# 3.想辦法讓以下程式順利執行

class String
  def is_uppercase?
      self == upcase # 等於 self == self.upcase
  end
end

puts "c".is_uppercase?                       # false
puts "C".is_uppercase?                       # true
puts "hello I AM DONALD".is_uppercase?       # false
puts "HELLO I AM DONALD".is_uppercase?       # true
puts "ACSKLDFJSgSKLDFJSKLDFJ".is_uppercase?  # false
puts "ACSKLDFJSGSKLDFJSKLDFJ".is_uppercase?  # true

# =================================================================

# 4.完成以下實作內容

def opposite(n)
  n * -1 # 龍哥：-n
end

puts opposite(1)   # -1
puts opposite(14)  # -14
puts opposite(-34) # 34

# =================================================================

# 5.完成以下實作內容

def repeat_str(n, s)
  puts s * n
end

repeat_str(6, "I")     # 印出 IIIIII
repeat_str(5, "Hello") # 印出 HelloHelloHelloHelloHello

# =================================================================

# 6.完成以下實作內容

# 找出離某個數字最近的平方數
def nearest_sq(n)
  near_num = Math.sqrt(n).round ** 2
end

puts nearest_sq(1)    # 1
puts nearest_sq(2)    # 1
puts nearest_sq(10)   # 9
puts nearest_sq(111)  # 121
puts nearest_sq(9999) # 10000

# =================================================================

# 7.完成以下實作

def monkey_count(n)
  (1..n).to_a # 龍哥：[*1..n]
end

p monkey_count(5)  # 印出 [1, 2, 3, 4, 5]
p monkey_count(3)  # 印出 [1, 2, 3]
p monkey_count(9)  # 印出 [1, 2, 3, 4, 5, 6, 7, 8, 9]
p monkey_count(10) # 印出 [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p monkey_count(20) # 印出 [1, 2, 3, 4, 5, 6,..略..18, 19, 20]

# =================================================================

# 8.完成以下實作

def count_sheep(num)
  # 龍哥方法
  (1..num).to_a.map { |x| "#{x} sheep..."}.join("")
  
  # 我的方法
  # result = ""
  # for x in 1..num do
  #     result << "#{x} sheep..."    
  # end
  # result
end

puts count_sheep(1)  # 印出 1 sheep...
puts count_sheep(2)  # 印出 1 sheep...2 sheep...
puts count_sheep(3)  # 印出 1 sheep...2 sheep...3 sheep...

# =================================================================

# 9.完成以下實作

def century(year)
    # 龍哥方法
  " #{(year / 100.0).ceil} 世紀"

  # 我的方法
  # if year % 100 > 0
  #     "#{year / 100 + 1} 世紀"
  # else
  #     "#{year / 100} 世紀"
  # end

end

puts century(1705)  # 18 世紀
puts century(1900)  # 19 世紀
puts century(1601)  # 17 世紀
puts century(2000)  # 20 世紀

# =================================================================

# 10.完成以下實作

def solution(sentence)
  sentence.split(" ").reverse.join(" ")
end

puts solution("The greatest victory is that which requires no battle") 
# 印出 battle no requires which that is victory greatest The

# =================================================================

# 11.計算傳入參數之平方和

def squareSum(numbers)
  # 龍哥作法
  Array(numbers).map { |number| number ** 2 }.sum
  
  # 我的作法
  # if numbers.is_a?(Integer)
  #     numbers ** 2    
  # else
  #     numbers.map { |number| number ** 2 }.sum
  # end
end

puts squareSum(2)          # 印出 4
puts squareSum([1, 2, 2])  # 印出 9

# =================================================================

# 12.移除頭尾的字元

def remove_char(s)
  s[1..-2]
end

p remove_char('eloquent')  # "loquen"
p remove_char('country')   # "ountr"
p remove_char('person')    # "erso"
p remove_char('place')     # "lac"
p remove_char('ok')        # ""

# =================================================================

# 13.計算所有的正整數的和

def positive_sum(arr)
  arr.select { |num| num > 0 }.sum
  # 龍哥提供另兩種方法
  # arr.select { |num| num.positive? }.sum
  # arr.select(&:positive?).sum
end

puts positive_sum([1,2,3,4,5])   # 15
puts positive_sum([1,-2,3,4,5])  # 13
puts positive_sum([-1,2,3,4,-5]) # 9

# =================================================================

# 14.打字員在打字的時候，因為看不清楚原稿件，把 S 打成 5、把 I 打成 1、把 O 打成 0，請寫一段程式可以校正原來打錯的字：

def correct(string)
  string.gsub(/[510]/, "5" => "S", "1" => "I", "0" => "O")
  # 龍哥另種方法
  # string.tr("510","SIO")
end

puts correct("L0ND0N")     # LONDON
puts correct("DUBL1N")     # DUBLIN
puts correct("51NGAP0RE")  # SINGAPORE
puts correct("BUDAPE5T")   # BUDAPEST
puts correct("PAR15")      # PARIS

# =================================================================

# 15. 算算裡面有幾個 true

def count_sheeps(array)
  # 龍哥方法
  array.count(true)

  # 我的方法
  # array.select { |x| x == true }.count
end

array1 = [true,  true,  true,  false,
          true,  true,  true,  true ,
          true,  false, true,  false,
          true,  false, false, true ,
          true,  true,  true,  true ,
          false, false, true,  true ]
              
puts count_sheeps(array1)  # 17

# =================================================================

# 16. 扣除陣列中最大值跟最小值之後的總和

def sum_array(arr)
  # 龍哥方法
  array = Array(arr)
  
  if array.count >= 3
    arr.sort[1..-2].sum
  else
    0
  end

  # if arr.nil? || arr.empty?
  #   0
  # else
  #   arr.sort[1..-2].sum
  # end
end

puts sum_array(nil)                      # 0
puts sum_array([])                       # 0
puts sum_array([3])                      # 0
puts sum_array([-3])                     # 0
puts sum_array([ 3, 5])                  # 0
puts sum_array([-3, -5])                 # 0
puts sum_array([6, 2, 1, 8, 10])         # 16
puts sum_array([6, 0, 1, 10, 10])        # 17
puts sum_array([-6, -20, -1, -10, -12])  # -28
puts sum_array([-6, 20, -1, 10, -12])    # 3

# =================================================================

# 17. 合併兩個陣列

def merge_arrays(a, b)
  # 龍哥方法
  (a | b).sort
  # 我的方法
  # (a + b).sort.uniq
end

p merge_arrays([1, 3, 5], [2, 4, 6])  # [1, 2, 3, 4, 5, 6]
p merge_arrays([2, 4, 8], [2, 4, 6])  # [2, 4, 6, 8]

# =================================================================

# 18. 縮寫產生器

def abbrev_name(name)
  # 龍哥方法
  name.split(" ").map { |word| word[0].capitalize }.join(".")
end

puts abbrev_name("Sam Harris")      # S.H
puts abbrev_name("Patrick Feenan")  # P.F
puts abbrev_name("Evan Cole")       # E.C
puts abbrev_name("P Favuzzi")       # P.F
puts abbrev_name("David Mendieta")  # D.M

# =================================================================

# 19. 觀察輸入內容及輸出結果，完成實作內容

def square_or_square_root(array)
  array.map do |x|
    if Math.sqrt(x) % 1 == 0
      # Math.sqrt(x).to_i
      Integer.sqrt(x)
    else
      x ** 2
    end
  end
end

p square_or_square_root([4, 3, 9, 7, 2, 1])      # [2, 9, 3, 49, 4, 1]
p square_or_square_root([100, 101, 5, 5, 1, 1])  # [10, 10201, 25, 25, 1, 1]
p square_or_square_root([1, 2, 3, 4, 5, 6])      # [1, 4, 9, 2, 25, 36]

# =================================================================

# 20. correct 參數是正確答案，answer 參數是學生作答答案，每答對一題得 4 分，答錯一題扣 1 分，沒答不得分也不扣分，請完成實作內容：

def check_exam(correct, answer)
  score = correct.zip(answer).map do |c, a|
    case a
    when c
      4
    when ""
      0
    else
      -1
    end
  end.sum

  # 龍哥寫法
  (score > 0) ? score : 0

  # 龍哥進階寫法
  # [score, 0].max

  # 我的寫法
  # if score > 0
  #   score
  # else
  #   0
  # end
end

p check_exam(["a", "a", "b", "b"], ["a", "c", "b", "d"])  # 6
p check_exam(["a", "a", "c", "b"], ["a", "a", "b",  ""])  # 7
p check_exam(["a", "a", "b", "c"], ["a", "a", "b", "c"])  # 16
p check_exam(["b", "c", "b", "a"], ["",  "a", "a", "c"])  # 0

# =================================================================

# 21. 請完成實作內容，請注意，在實作內容中不能使用 0123456789*+-/ 字元

def give_me_five
  "aaaaa".length
end  

puts give_me_five  # 5

# =================================================================

# 22. 想辦法讓以下程式正常運作：

class Array
  def second
    self[1]
  end
end

p [1,2,3].second  # 2
p [].second       # nil
p [1].second      # nil

# =================================================================

# 23. 完成以下實作內容

def compute
  if block_given?
    yield
  else
    "Do not compute"
  end
end

puts compute { "Block" }  # 印出 Block
puts compute              # 印出 Do not compute

# =================================================================

# 24. 完成以下實作內容

class Ghost
  def color
    # 龍哥作法
    ["white", "yellow", "purple", "red"].sample
    # 我的作法
    # ran_color = ["white", "yellow", "purple", "red"]
    # ran_color[rand(0..3)]
  end
end

ghost = Ghost.new
puts ghost.color          # 隨機印出 white, yellow, purple, red 這四種顏色的字串

# =================================================================

# 25. 完成以下實作內容

class Cat
  def initialize(name)
    @name = name
  end
  def speak
    puts "#{@name} meows."
  end
end

kitty = Cat.new('Mr Whiskers')
kitty.speak   # 印出 Mr Whiskers meows.

nancy = Cat.new('Lamp')
nancy.speak   # 印出 Lamp meows.

sherly = Cat.new('$$Money Bags$$')
sherly.speak  # 印出 $$Money Bags$$ meows.

# =================================================================

# 26. 完成以下實作

class Ball
  def initialize(ball_type = "regular")
    @ball_type = ball_type
  end

  def ball_type
    @ball_type
  end
end

ball1 = Ball.new
puts ball1.ball_type   # 印出 regular

ball2 = Ball.new("super")
puts ball2.ball_type   # 印出 super

# =================================================================

# 27. 完成以下實作

def format_money(amount)
  "$#{'%.2f' % amount }"

  # 一開始自己的寫法
  # "$#{round(amount)}"
end

puts format_money(39.99)  # 印出 $39.99
puts format_money(39.90)  # 印出 $39.90
puts format_money(39)     # 印出 $39.00

# =================================================================

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

# =================================================================

# 29. 「二的 N 次方」，當 n = 0，印出 2 的 0 次方；當 n = 2，印出 2 的 0 次方、2 的 1 次方、2 的 2 次房，以此類推。完成以下實作：

def powers_of_two(n)
  (0..n).map { |n| 2 ** n }
  # (0..n).to_a.map { |n| 2 ** n }
end

p powers_of_two(0)   # [1]
p powers_of_two(1)   # [1, 2]
p powers_of_two(4)   # [1, 2, 4, 8, 16]

# =================================================================

# 30. 實作猜拳程式

def rock_paper_scissor(p1, p2)
  win_table = {'rock' => 'scissors', 'scissors' => 'paper', 'paper' => 'rock'}

  if p1 == p2
    "Draw!"
  else
    if win_table.has_key?(p1) && win_table[p1] == p2
      "Player 1 won!"
    else
      "Player 2 won!"
    end
  end

  # 原本寫的
  # if p1 == p2
  #   "Draw!"
  # elsif (p1 == 'rock') && (p2 == 'scissors')
  #   "Player 1 won!"
  # elsif (p1 == 'paper') && (p2 == 'rock')
  #   "Player 1 won!"
  # elsif (p1 == 'paper') && (p2 == 'scissors')
  #   "Player 2 won!"
  # elsif (p1 == 'rock') && (p2 == 'paper')
  #   "Player 2 won!"
  # end
end

puts rock_paper_scissor('rock', 'scissors')      # 印出 Player 1 won!
puts rock_paper_scissor('paper', 'rock')         # 印出 Player 1 won!
puts rock_paper_scissor('paper', 'scissors')     # 印出 Player 2 won!
puts rock_paper_scissor('rock', 'paper')         # 印出 Player 2 won!
puts rock_paper_scissor('rock', 'rock')          # 印出 Draw!
puts rock_paper_scissor('scissors', 'scissors')  # 印出 Draw!

# =================================================================

# 31. 是不是晚來了？

# last = 上次日期，today = 今天日期，cycle_length = 週期
require 'date'

def is_period_late?(last, today, cycle_length)
  # last_day = Date.parse last
  # today = Date.parse today
  # (today - last_day).to_i > cycle_length
  Date.parse(today) - Date.parse(last) > cycle_length
end

puts is_period_late?('2016/6/13', '2016/7/16', 35) # false
puts is_period_late?('2016/6/13', '2016/7/16', 28) # true
puts is_period_late?('2016/6/13', '2016/7/16', 35) # false
puts is_period_late?('2016/6/13', '2016/6/29', 28) # false
puts is_period_late?('2016/7/12', '2016/8/9', 28)  # false
puts is_period_late?('2016/7/12', '2016/8/10', 28) # true
puts is_period_late?('2016/7/1', '2016/8/1', 30)   # true
puts is_period_late?('2016/6/1', '2016/6/30', 30)  # false
puts is_period_late?('2016/1/1', '2016/1/31', 30)  # false
puts is_period_late?('2016/1/1', '2016/2/1', 30)   # true

# =================================================================

# # L7-002 選出及格(60 分以上)的科目

def my_languages(scores)
  # scores.select { |k, v| v >= 60 }.keys
  scores.select { |subject, score| score >= 60 }.keys
end

RSpec.describe do
  it "選出及格(60 分以上)的科目" do
    expect(my_languages({"Java" => 10, "Ruby" => 80, "Python" => 65})).to eq ["Ruby", "Python"]
    expect(my_languages({"Hindi" => 60, "Dutch" => 93, "Greek" => 71})).to eq ["Hindi", "Dutch", "Greek"]
    expect(my_languages({"C++" => 50, "ASM" => 10, "Haskell" => 20})).to eq []
  end
end

# =================================================================

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

# =================================================================

# L7-004 工廠的某台印表機只能印出 a 到 m 的字，請完成實作內容，把不應該出現的字算出來

def printer_error(s)
  string_length = s.length
  # incorrect = s.split("").map(&:ord).select { |n| n > 109 }.count
  # incorrect = s.split("").select { |n| n > 'm' }.count
  # "#{incorrect}/#{string_length}"
  "#{s.scan(/[^a-m]/).count}/#{s.length}"
end

RSpec.describe do
  it "不該出現的字" do
    expect(printer_error("aaabbbbhaijjjm")).to eq '0/14'
    expect(printer_error("aaaxbbbbyyhwawiwjjjwwm")).to eq '8/22'
    expect(printer_error("aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz")).to eq '3/56'
  end
end

# =================================================================

# 5. 一夥人去吃飯，大家先各自付帳，待後續再計算多退少補，請根據輸出結果完成以下實作。

# L7-005 一夥人去吃飯，大家先各自付帳，待後續再計算多退少補，請根據輸出結果完成以下實作。

def split_the_bill(bill)
  # avg_pay = bill.values.sum / 3
  # bill.map { |k, v| [k, ("%.1f" % (v - avg_pay)).to_i] }.to_h
  avg = bill.values.sum / bill.count.to_f
  bill.transform_values { |v| v - avg }
end

RSpec.describe do
  it "帳單計算" do
    expect(split_the_bill('A' => 20, 'B' => 15, 'C' => 10)).to eq({'A' => 5.00, 'B' => 0.00, 'C' => -5.00})
    expect(split_the_bill('A' => 40, 'B' => 25, 'X' => 10)).to eq({'A' => 15.00, 'B' => 0.00, 'X' => -15.00})
  end
end

# =================================================================

# 6. 計算有幾個母音字母(a, e, i, o, u)

# L7-006 計算有幾個母音字母(a, e, i, o, u)

def vowel_count(string)
  # string.chars.select { |n| n == 'a' || n == 'e' || n == 'i' || n == 'o' || n == 'u'}.count
  string.count('aeiou')
end

RSpec.describe do
  it "計算有幾個母音字母" do
    expect(vowel_count("abracadabra")).to be 5
    expect(vowel_count("5xruby")).to be 1
    expect(vowel_count("iloveyou")).to be 5
  end
end

# =================================================================

# 7. 觀察輸出結果，實作相對應的程式：

# L7-007 觀察輸出結果，實作相對應的程式

def accum(s)
  # result = ""
  # counter = -1
  # result = s.upcase.chars.map do |ss|
  #             counter += 1
  #             ss + ss.downcase * counter
  #           end
  # result.join("-")
  s.chars.map.with_index { |c, index| (c * (index + 1)).capitalize }.join("-")
end

RSpec.describe do
  it "觀察輸出結果，實作相對應的程式" do
    expect(accum("ZpglnRxqenU")).to eq 'Z-Pp-Ggg-Llll-Nnnnn-Rrrrrr-Xxxxxxx-Qqqqqqqq-Eeeeeeeee-Nnnnnnnnnn-Uuuuuuuuuuu'
    expect(accum("NyffsGeyylB")).to eq 'N-Yy-Fff-Ffff-Sssss-Gggggg-Eeeeeee-Yyyyyyyy-Yyyyyyyyy-Llllllllll-Bbbbbbbbbbb'
    expect(accum("MjtkuBovqrU")).to eq 'M-Jj-Ttt-Kkkk-Uuuuu-Bbbbbb-Ooooooo-Vvvvvvvv-Qqqqqqqqq-Rrrrrrrrrr-Uuuuuuuuuuu'
    expect(accum("EvidjUnokmM")).to eq 'E-Vv-Iii-Dddd-Jjjjj-Uuuuuu-Nnnnnnn-Oooooooo-Kkkkkkkkk-Mmmmmmmmmm-Mmmmmmmmmmm'
    expect(accum("HbideVbxncC")).to eq 'H-Bb-Iii-Dddd-Eeeee-Vvvvvv-Bbbbbbb-Xxxxxxxx-Nnnnnnnnn-Cccccccccc-Ccccccccccc'
  end
end

# =================================================================

# 8. 找出中間的字

# L7-008 找出中間的字

def get_middle(string)
  # length = string.length
  # if length % 2 == 0
  #   string[length / 2 - 1] + string[length / 2]
  # else
  #   string[length / 2]
  # end
  len = string.length
  if len <= 2
    string
  else
    len.odd? ? string[ len / 2 ] : string[ len / 2 - 1, 2]
  end


end

RSpec.describe do
  it "找出中間的字" do
    expect(get_middle("test")).to eq 'es'
    expect(get_middle("testing")).to eq 't'
    expect(get_middle("middle")).to eq 'dd'
    expect(get_middle("A")).to eq 'A'
    expect(get_middle("of")).to eq 'of'
  end
end

# =================================================================

# L7-009 這是個三角形嗎？

def is_triangle?(a, b, c)
  # (a + b > c) && (b + c > a) && (a + c > b)
  [a, b, c].min(2).sum > [a, b, c].max
end

RSpec.describe do
 it "這是個三角形嗎？" do
   expect(is_triangle?(1,2,2)).to be true
   expect(is_triangle?(7,2,2)).to be false
 end
end

# =================================================================

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

# =================================================================

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

# =================================================================

# L7-012 實作以下內容

# 把 code 寫在這兒！
class Person
  # def initialize(*name)
  #   @name = name.join(" ")
  # end
  # def greet
  #   "Hello, #{@name}!"
  # end
  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end
  def greet
    "Hello, #{@first_name} #{@last_name}!"
  end
end

RSpec.describe do
  it "當個有禮貌的人" do
    person = Person.new('Bob', 'Smith')
    expect(person.greet).to eq 'Hello, Bob Smith!'
  end
end

# =================================================================

# L7-013 實作以下內容

class Block
  # def initialize(array)
  #   @array = array
  # end

  # def width
  #   @array[0]
  # end
  # def length
  #   @array[1]
  # end
  # def height
  #   @array[2]
  # end
  # def volume
  #   @array.reduce(1) { |start, i| start * i }
  # end
  # def surface_area
  #   @array[0] * @array[1] * 6
  # end
  attr_reader :width, :length, :height
  def initialize(array)
    @width, @length, @height = array
  end

  def volume
    width * length * height
  end

  def surface_area
    (@widt * length + length * height + width * height) * 2
  end
end

RSpec.describe do
  it "實作內容" do
    cube = Block.new([2,2,2])

    expect(cube.width).to be 2
    expect(cube.length).to be 2
    expect(cube.height).to be 2
    expect(cube.volume).to be 8
    expect(cube.surface_area).to be 24
  end
end

# =================================================================

# L7-014 調整以下實作，讓程式可順利執行

class Human
  # def initialize(my_name)
  #   @my_name = my_name
  # end

  # def greet(your_name)
  #   "Hello #{your_name}, my name is #{@my_name}"
  # end
  
  # def name
  #   @my_name
  # end
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def greet(your_name)
    "Hello #{your_name}, my name is #{@name}"
  end

end



RSpec.describe do
  it "打招呼！" do
    jack = Human.new("Jack")
    jill = Human.new("Jill")

    expect(jack.greet("Jill")).to eq "Hello Jill, my name is Jack"
    expect(jack.greet("Mary")).to eq "Hello Mary, my name is Jack"
    expect(jill.greet("Jack")).to eq "Hello Jack, my name is Jill"
    expect(jill.name).to eq 'Jill'
  end
end

# =================================================================

# L7-015 計算不重複元素的總合
def non_repeat_sum(arr)
  # arr.select { |e| arr.count(e) == 1 }.sum
  arr.select { |item| arr.count == 1 }.sum
end

RSpec.describe do
  it "計算不重複元素的總合" do
    expect(non_repeat_sum([4,5,7,5,4,8])).to be 15
    expect(non_repeat_sum([9, 10, 19, 13, 19, 13])).to be 19
    expect(non_repeat_sum([16, 0, 11, 4, 8, 16, 0, 11])).to be 12
    expect(non_repeat_sum([5, 17, 18, 11, 13, 18, 11, 13])).to be 22
    expect(non_repeat_sum([5, 10, 19, 13, 10, 13])).to be 24
  end
end

# =================================================================

# You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block for each letter (direction) and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.
# 翻譯：總之最多只能走10個街區，且相鄰不能是同樣的街區名稱


def is_valid_walk(walk)
  count = 0
  return "should return false" if walk.length != 10
  walk.each.with_index do |w, i|
    count += 1 if w == walk[i+1]
  end
  return "should return false" if count > 0
  "should return true"
end

RSpec.describe do
  it "計算不重複元素的總合" do
    expect(is_valid_walk(['n','s','n','s','n','s','n','s','n','s'])).to eq('should return true')
    expect(!is_valid_walk(['w','e','w','e','w','e','w','e','w','e','w','e'])).to eq('should return false')
    expect(!is_valid_walk(['w'])).to eq('should return false')
    expect(!is_valid_walk(['n','n','n','s','n','s','n','s','n','s'])).to eq('should return false')
  end
end

# =================================================================

def find_it(seq)
  seq.find{|c| seq.count(c).odd? }
  # seq.group_by(&:itself).select { |k, v| v.length.odd? }.keys[0]
end

RSpec.describe do
  it "Basic tests" do
    expect(find_it([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5])).to eq(5)
    expect(find_it([1,1,2,-2,5,2,4,4,-1,-2,5])).to eq(-1)
    expect(find_it([20,1,1,2,2,3,3,5,5,4,20,4,5])).to eq(5)
    expect(find_it([10])).to eq(10)
    expect(find_it([1,1,1,1,1,1,10,1,1,1,1])).to eq(10)
  end
end

# =================================================================

def in_array(array1, array2)
  # result = []
  # array2.each do |a2|
  #   array1.each do |a1|
  #     if a2.include? a1
  #       result << a1
  #     end
  #   end
  # end
  # result.uniq.sort
  array1.select{|s| array2.any?{|w| w.include?(s) } }.sort
end

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

# =================================================================

# 找質數

require 'active_support/core_ext'

def isPrime(input)
  return false if input < 1
  return true if input == 2
  [*(2..(Math.sqrt(input).ceil))].select { |i| (input % i) == 0  }.blank?
end

RSpec.describe "isPrime" do
  it "Should return false for non-prime numbers." do
    expect(isPrime(4)).to eq(false)
    expect(isPrime(100)).to eq(false)
    expect(isPrime(999)).to eq(false)
    expect(isPrime(958297)).to eq(false)
    expect(isPrime(-7)).to eq(false)
  end
  
  it "Should return true for prime numbers." do
    expect(isPrime(2)).to eq(true)
    expect(isPrime(3)).to eq(true)
    expect(isPrime(5)).to eq(true)
    expect(isPrime(457)).to eq(true)
    expect(isPrime(39229)).to eq(true)
  end
end

# =================================================================

# 電影院店員


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

# =================================================================

# 數字拆解成各分位

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

# =================================================================

# https://www.codewars.com/kata/5202ef17a402dd033c000009/train/ruby

def title_case(title, minor_words = '')
  return '' if title == ''
  return title.split(" ").map(&:capitalize).join(" ") if title.length != 0 && minor_words == ''

  if minor_words.length != 0
    minor = minor_words.split(" ").map(&:capitalize)
  end

  result = title.split(" ").map(&:capitalize).map do |t|
             minor.each do |m|
               if t == m
                t = t.downcase
                break
               end
             end
             t
           end
  result[0] = result[0].capitalize
  result.join(" ")
end

RSpec.describe "Title Case" do
  it "Example cases" do
    expect(title_case('')).to eq('')
    expect(title_case('a clash of KINGS', 'a an the of')).to eq('A Clash of Kings')
    expect(title_case('THE WIND IN THE WILLOWS', 'The In')).to eq('The Wind in the Willows')
    expect(title_case('the quick brown fox')).to eq('The Quick Brown Fox')
  end
end

# =================================================================

def rgb(r, g, b)
  # result = ""
  # arr = [r, g, b]

  # first = arr.map do |a|
  #           a = 255 if a >= 255
  #           a = 0 if a <= 0
  #           a
  #         end

  # first.each do |n|
  #         result += n.to_s(16).length == 1 ? "0" + n.to_s(16).upcase : n.to_s(16).upcase
  #       end

  # result

  "%.2X%.2X%.2X" % [r,g,b].map{|i| [[i,255].min,0].max}
end

RSpec.describe "RGB To Hex Conversion" do
  it "Example cases" do
    expect(rgb(0, 0, 0)).to eq('000000')
    expect(rgb(0, 0, -20)).to eq('000000')
    expect(rgb(300,255,255)).to eq('FFFFFF')
    expect(rgb(173,255,47)).to eq('ADFF2F')
  end
end

# =================================================================

def spinWords(string)
  # 先拆成字串
  # 判斷個別長度，大於等於5的就要 reverse
  string.split(" ").map { |s| s.length >= 5 ? s.reverse : s }.join(" ")
end


RSpec.describe "Stop gninnipS My sdroW!" do
  it "Example cases" do
    expect(spinWords("Hey fellow warriors")).to eq("Hey wollef sroirraw")
  end
end

# =================================================================

def pig_it text
  text.split.map { |n| n =~ /[[:punct:]]/ ? n : n[1..-1] + n[0] + "ay" }.join(" ")
end

RSpec.describe "Simple Pig Latin" do
  it "Example cases" do
    expect(pig_it('Pig latin is cool')).to eq('igPay atinlay siay oolcay')
    expect(pig_it('This is my string')).to eq('hisTay siay ymay tringsay')
  end
end