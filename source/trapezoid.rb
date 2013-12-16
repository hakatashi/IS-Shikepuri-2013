def f(x)
  x/((x+1.0)*(x+2.0))
end

def trapezoid(xs,xe,n)
  deltax = (xe-xs)*1.0/n
  sum = (f(xs)+f(xe))/2.0
  for i in 1..(n-1)
    sum = sum + f(xs+i*deltax)
  end
  deltax * sum
end

# version 1.2
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
