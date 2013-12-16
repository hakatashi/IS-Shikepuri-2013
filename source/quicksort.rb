# quicksort.rb

def quicksort(a)
  qsort(a, 0, a.length()-1)
end

def qsort(a, from, to)  
  if from < to
    pivot = (from + to) / 2
    med = a[pivot]
    l = from
    r = to  
    while l <= r do
      while a[l] < med
        l = l + 1
      end
      while a[r] > med
        r = r - 1
      end
      if l <= r
        tmp = a[l]
        a[l] = a[r]
        a[r] = tmp
        l = l + 1
        r = r - 1
      end
    end
    qsort(a, from, r)
    qsort(a, l, to)
  end
  a
end

# version 1.1
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
