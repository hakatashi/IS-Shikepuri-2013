# animated_quicksort.rb
# Animated version of quicksort.  This only shows the range of the quicksort
# recursion (from .. to) by yellow colored persons and animates person
# swapping. 

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

def quicksort(a)
  qsort(a, 0, a.length()-1)
end

def qsort(a, from, to)
  if from < to
    for i in from .. to        # color person yellow in from .. to
      a[i].color = [1, 1, 0]   #
    end                        #
    pivot = (from + to) / 2
    med = a[pivot]
    med.color = [1,0,0]        # color pivot person red
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
        a[r].move(index_to_x(l), 400) # swap fisrt
        a[r] = tmp
        tmp.move(index_to_x(r), 400)  # swap second
        l = l + 1
        r = r - 1
      end
    end
    for i in from .. to        # reset person's color before recursive call
      a[i].color = [1, 1, 1]   #
    end                        #
    qsort(a, from, r)
    qsort(a, l, to)
  end
  a
end


# version 1.1
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
