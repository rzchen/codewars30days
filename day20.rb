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