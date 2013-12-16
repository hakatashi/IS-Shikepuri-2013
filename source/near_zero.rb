def epsilon()
  0.0000001
end

def near_zero(x)
  -epsilon() < x && x < epsilon()
end

# version 1.3
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
