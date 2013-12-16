include(Math)
load("./abs.rb")
load("./make1d.rb")

def f(x)
  log(x)
end

def cancellations(x,h_digits)
  errors=make1d(h_digits+1)
  for i in 0..h_digits
    h = 0.1**i
    df=(f(x+h)-f(x))/h
    errors[i] = abs(df-1.0/x)
  end
  errors
end

# version 1.3
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
