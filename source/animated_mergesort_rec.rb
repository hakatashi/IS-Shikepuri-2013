# animated_mergesort_rec.rb
# A recursive version
# Two merged array flash for a while, then merging operation is visualized. 

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

#----- functions for mergesort animation -----

def is_even(n)
  n % 2 == 0
end

def next_y(person)     # Persons alternate their y-coordinate. 
  if person.y == 400
    200
  else
    400
  end
end

def move_smaller(person, dx)
  person.move(person.x + dx * 30, next_y(person))
end

#----- animated sorting program -----
# Commented lines (with #) are inserted for animation. 

def merge(a, b)
  for i in 0..(a.length() - 1)   # flash left array in red
    a[i].flash(0.5, [1, 0, 0])   #
  end                            #
  for i in 0..(b.length() - 1)   # flash right array in blue
    b[i].flash(0.5, [0, 0, 1])   #
  end                            #
  c = Array.new(a.length() + b.length())
  ia = 0
  ib = 0
  ic = 0
  while ia < a.length() && ib < b.length()
    if a[ia] < b[ib]
      c[ic] = a[ia]
      move_smaller(c[ic], ic - ia)  # move smaller person
      ia = ia + 1
      ic = ic + 1
    else
      c[ic] = b[ib]
      move_smaller(c[ic], ic - (a.length() + ib)) # ditto
      ib = ib + 1
      ic = ic + 1
    end
  end
  if ia < a.length()
    for i in ia..(a.length() - 1)
      c[ic] = a[i]
      move_smaller(c[ic], ic - i)   # move remaining person
      ic = ic + 1
    end
  else
    if ib < b.length()
      for i in ib..(b.length() - 1)
        c[ic] = b[i]
        move_smaller(c[ic], ic - (a.length() + i)) # ditto
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
