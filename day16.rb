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