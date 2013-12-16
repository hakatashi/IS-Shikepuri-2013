def min_index(a, i)
  min_value = a[i]
  min_index = i
  for j in (i+1)..(a.length()-1)
    if a[j] < min_value
      min_value = a[j]
      min_index = j
    end
  end
  min_index
end

def simplesort(a)
  for i in 0..(a.length()-1)
    k = min_index(a,i)
    v = a[i]
    a[i] = a[k]
    a[k] = v
  end
  a
end

# version 1.3
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
