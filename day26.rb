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