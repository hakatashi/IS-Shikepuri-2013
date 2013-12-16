# more_animated_quicksort_2.rb
# This version reflects comparison timing as exactly as possible.  So it
# is more clearly understood than more_animated_quicksort.rb. 
# But it uses multiple sentences in the condition part of while statement, 
# which is not generally recommended for easy-to-understand programs.  

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
    for i in from .. to          # color person yellow in from .. to
      a[i].color = [1, 1, 0]     #
    end                          #
    pivot = (from + to) / 2
    med = a[pivot]
    med.color = [1,0,0]          # color pivot person red
    l = from
    r = to
    while l <= r do
      while 
            (a[l].raise_hand()   # compared persons raise their hands and
             med.raise_hand()    # soon lower them. 
             a[l].lower_hand()   #
             med.lower_hand()    # Sentences will return the last value. 
             a[l] < med
            )                    # 
        l = l + 1
      end
      while
            (a[r].raise_hand()   # the same as above
             med.raise_hand()    #
             a[r].lower_hand()   #
             med.lower_hand()    #
             a[r] > med
            )                    #
        r = r - 1
      end
      p1 = a[l] ; p2 = a[r]    # use p1, p2 because their indeces will change
      p1.raise_hand(); p2.raise_hand()  # raise hand of to-be-swapped persons
      if l <= r
        tmp = a[l]
        a[l] = a[r]
        a[r].move(index_to_x(l), 400) # swap fisrt
        a[r] = tmp
        tmp.move(index_to_x(r), 400)  # swap second
        l = l + 1
        r = r - 1
      end
      p1.lower_hand(); p2.lower_hand() # lower hand of swapped person
    end
    for i in from .. to          # reset all persons' color before
      a[i].color = [1, 1, 1]     # next recursive call 
    end                          #
    qsort(a, from, r)
    qsort(a, l, to)
  end
  a
end


# version 1.1
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
