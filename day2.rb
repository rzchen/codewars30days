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