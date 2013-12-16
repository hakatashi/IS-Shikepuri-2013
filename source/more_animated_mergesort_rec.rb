# more_animated_mergesort_rec.rb
# A recursive version. 
# This version shows comparison by raising compared person's hand, and
# shows the merged two arrays by two solid colors red and blue, whereas
# animate_mergesort_rec.rb shows them only by flashing.  You will see more 
# accurately when comparison occurs.  Some persons are moved without 
# comparison.  
# Note that the definition of move_smaller is changed. 

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
  person.lower_hand()            # lower hand of moved person
  person.color = [1,1,1]         # reset its color
end

#----- animated sorting program -----
# Commented lines (with #) are inserted for animation. 

def merge(a, b)
  for i in 0..(a.length() - 1) # left array is colored red
    a[i].color = [1, 0, 0]     #
  end                          #
  for i in 0..(b.length() - 1) # right array is colored blue
    b[i].color = [0, 0, 1]     #
  end                          #
  c = Array.new(a.length() + b.length())
  ia = 0
  ib = 0
  ic = 0
  while ia < a.length() && ib < b.length()
    a[ia].raise_hand() ; b[ib].raise_hand() # raise hands of compared persons
    if a[ia] < b[ib]
      c[ic] = a[ia]
      move_smaller(c[ic], ic - ia) # move smaller person
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
      move_smaller(c[ic], ic - i) # move remaining person
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


# version 1.1
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
