load("./make2d.rb")
load("./max.rb")

def g()
  -2
end

def q(c,d)
   if c == d
       return 2
   else
       return -1
   end
end

def align(s,t)
  m = s.length()
  n = t.length()
  a = make2d(m+1,n+1)
  a[0][0] = 0
  for j in 1..n
    a[0][j] = a[0][j-1] + g()
  end
  for i in 1..m
    a[i][0] = a[i-1][0] + g()
  end
  for i in 1..m 
    for j in 1..n
      
    end
  end
  a
end

def traceback(a,s,t)
  u = ""
  v = ""
  i = s.length()
  j = t.length()
  while i>0 || j>0
    if j>0 && a[i][j] == a[i][j-1] + g()
      u = "-"           + u
      v = t[j-1 .. j-1] + v
      j = j - 1 # go left
    else
      if i>0 && j>0 &&
          a[i][j] == a[i-1][j-1] + q(s[i-1], t[j-1])
        
      else
        if i>0 && a[i][j] == a[i-1][j] + g()
          
        end
      end
    end
  end
  [u,v]
end

def align_dp(s,t)
  traceback(align(s,t),s,t)
end

# version 1.4
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
