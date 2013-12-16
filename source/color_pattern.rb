load("./make2d.rb")
load("./abs.rb")

def color_pattern(s)
  image = make2d(s,s)
  for y in 0..(s-1)
    for x in 0..(s-1)
      r = (y+1.0)/s             #red
      g = (x+1.0)/s             #green
      b = abs(x+y+2.0-s)/s      #blue
      image[y][x] = [r,g,b]
    end
  end
  image
end

# version 1.1
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
