load("./make2d.rb")

def siercarpet(n)
  a = make2d(3**n, 3**n)
  subsiercarpet(a, n, 0, 0)
  show(a)
end

def subsiercarpet(a, n, x, y)
  if n == 0
    a[x][y] = 1
  else
    for carpX in 0..2 do
      for carpY in 0..2 do
        if carpX != 1 || carpY != 1
          subsiercarpet(a, n - 1, x + carpX * 3 ** (n-1), y + carpY * 3 ** (n-1))
        else
          for fillX in 0..3**(n-1)-1 do
            for fillY in 0..3**(n-1)-1 do
              a[x + carpX * 3 ** (n-1) + fillX][y + carpY * 3 ** (n-1) + fillY] = 0
            end
          end
        end
      end
    end
  end
end

