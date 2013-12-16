load("./distance.rb")
load("./make2d.rb")

def b(s,x,y)
  # WRITE THE DEFINITION OF B DOWN HERE
end

def sphere(s)
  image = make2d(s,s)
  for y in 0..(s-1) 
    for x in 0..(s-1)
      image[y][x] = b(s,x,y)
    end	
  end	
  image
end

# version 1.5
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
