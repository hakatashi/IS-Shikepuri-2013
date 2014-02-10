load("./make2d.rb")

def sierpinski(n)
  a = make2d(n, n)
  a[0][0] = 1
  for x in 1..n-1
    a[x][0] = 1
    for y in 1..(x-1)
      a[x][y] = a[x-1][y-1] ^ a[x-1][y]
    end
    a[x][x] = 1
  end
  show(a)
end
