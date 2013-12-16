# more_animated_quicksort_3.rb
# This version reflects comparison timing as exactly as possible, and ranges
# of from..to in recursive calls more clearly as you can see.  Unprocessed 
# range of the array is aligned at some height and it will be gradually divided
# into smaller ranges and sorted recursively.  Finally, all sorted elements go
# down to the normal y-coordinate.  
# It uses multiple sentences in the condition part of while statement, 
# which is not generally recommended for easy-to-understand programs.  
# The animation program segments inserted in this program are not easy to
# understand, but if you completely understand the animation program segments,
# you completely understand the originarl quicksort program. 

#----- common to all animated sorting programs -----
include(Komaba::MiniStar)

def index_to_x(i)
  i * 30 + 60
end

def calc_y(i)
  400 - 100 * i / 16
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
  for i in 0..15                 # reset y-coordinates after sorting 
    a[i].move(a[i].x, 400)       #
  end                            #
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
            (a[l].raise_hand()       # compared persons raise their hands and
             med.raise_hand()        # soon lower them. 
             a[l].lower_hand()       #
             med.lower_hand()        # Sentences will return the last value. 
             a[l] < med
            )                        # 
        if a[l] != med               # if a[l] is not pivot
          a[l].color = [0.6, 0.6, 0] # color the left darker yellow
        end                          #
        l = l + 1
      end
      while
            (a[r].raise_hand()       # the same as above
             med.raise_hand()        #
             a[r].lower_hand()       #
             med.lower_hand()        #
             a[r] > med
            )                        #
        if a[r] != med               # if a[r] is not pivot
          a[r].color = [1, 1, 0.8]   # color the right lighter yellow
        end                          #
        r = r - 1
      end
      p1 = a[l] ; p2 = a[r]    # use p1, p2 because their indeces will change
      p1.raise_hand(); p2.raise_hand()   # raise hand of to-be-swapped persons
      if l <= r
        tmp = a[l]
        a[l] = a[r]
        a[r].move(index_to_x(l), a[r].y) # swap fisrt
        a[r] = tmp
        tmp.move(index_to_x(r), tmp.y)   # swap second
        if a[l] != med                   # if a[l] is not pivot
          a[l].color = [0.6, 0.6, 0]     # color the left
        end                              #
        if a[r] != med                   # if a[r] is not pivot
          a[r].color = [1, 1, 0.8]       # color the right
        end                              #
        l = l + 1
        r = r - 1
      end
      p1.lower_hand(); p2.lower_hand()   # lower hand of swapped person
    end
    for i in from .. to                  # reset all persons' color before
      a[i].color = [1, 1, 1]             # next recursive call 
      a[i].y = calc_y(from)              # set y-coordinate of persons
    end                                  # in the left group
    for i in r+1 .. l-1                  # set y-coordinate of persons
      a[i].y = calc_y(r+1)               # in the middle group if any 
    end                                  #
    for i in l .. to                     # set y-coordinate of persons
      a[i].y = calc_y(l)                 # in the right group
    end                                  #
    qsort(a, from, r)
    qsort(a, l, to)
  end
  a
end

# version 1.1
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
