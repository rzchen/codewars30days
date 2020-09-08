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