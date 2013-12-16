def simplesort(a)
  for i in 0..(a.length()-1)
    min_value = a[i]
    min_index = i
    for j in (i+1)..(a.length()-1)
      if a[j] < min_value
        min_value = a[j]
        min_index = j
      end
    end
    a[min_index] = a[i]
    a[i] = min_value
  end
  a
end