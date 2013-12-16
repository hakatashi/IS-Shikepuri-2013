require('./Practice_5_5.rb')

def fibm(k)
  pow = matpower([[1, 1], [1, 0]], k)
  pow[1][0] + pow[1][1]
end
