def reconstruct(s)
  n=s.length()
  l=s[0].length()
  m=coefficients(l,n)
  equations=make_equations(l,n,m,s)
  solved=gjp(equations)
  equations_to_image(l,solved)
end


# version 1.7
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
