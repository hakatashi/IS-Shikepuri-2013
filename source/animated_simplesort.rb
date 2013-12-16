# animated_simplesort.rb
# Found minimum person is flashed and then swapping operation is visualized.

#----- common to all animated sorting programs -----
include(Komaba::MiniStar)

def index_to_x(i)
  i * 30 + 60
end

def person16()
  a = Array.new(16)
  for i in 0..15
    a[i] = Person.new()
    a[i].x = index_to_x(i)
    a[i].y = 400
    a[i].height = rand(60) + 40
  end
  a
end

#----- animated sorting program -----
# Commented lines (with #) are inserted for animation. 

def min_index(a, i)
  min = i 
  for j in (i+1)..(a.length()-1)
    if a[j] < a[min]
      min = j
    end
  end
  min
end

def simplesort(a)
  for i in 0..(a.length()-1)
    k = min_index(a, i)
    a[k].flash(0.5)                 # flash found minimum person
    tmp = a[i]
    a[i] = a[k]
    a[k].move(index_to_x(i), 400)   # move minimum person first
    a[k] = tmp
    tmp.move(index_to_x(k), 400)    # then move swapped person
  end
  a
end



# version 1.4
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
