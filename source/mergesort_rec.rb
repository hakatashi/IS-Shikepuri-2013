# mergesort_rec.rb
# A recursive version

def merge(a, b)
  c = Array.new(a.length() + b.length())
  ia = 0
  ib = 0
  ic = 0
  while ia < a.length() && ib < b.length()
    if a[ia] < b[ib]
      c[ic] = a[ia]
      ia = ia + 1
      ic = ic + 1
    else
      c[ic] = b[ib]
      ib = ib + 1
      ic = ic + 1
    end
  end
  if ia < a.length()
    for i in ia..(a.length() - 1)
      c[ic] = a[i]
      ic = ic + 1
    end
  else
    if ib < b.length()
      for i in ib..(b.length() - 1)
        c[ic] = b[i]
        ic = ic + 1
      end
    end
  end
  c
end

def mergesort(a)
  submergesort(a,0,a.length())
end

def submergesort(a,i,n)
  if n<2
    if n==0
      []
    else
      [a[i]]
    end
  else
    merge(submergesort(a,i,n/2),submergesort(a,i+n/2,n-n/2))
  end
end


# version 1.2
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
