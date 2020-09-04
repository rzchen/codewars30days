def format_money(amount)
  "$#{'%.2f' % amount }"

  # 一開始自己的寫法
  # "$#{round(amount)}"
end

puts format_money(39.99)  # 印出 $39.99
puts format_money(39.90)  # 印出 $39.90
puts format_money(39)     # 印出 $39.00