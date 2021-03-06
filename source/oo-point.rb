class Point
  attr_accessor("x", "y")

  def initialize(u,v)
    self.x = u
    self.y = v
  end

  def scale(s)
    Point.new(self.x * s, self.y * s)
  end

  def add(q)
    Point.new(self.x + q.x, self.y + q.y)
  end
end

# version 1.3
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
