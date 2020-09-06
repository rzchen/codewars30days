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