class Request
  attr_accessor("title", "next")

  def initialize(t)
    self.title = t
    self.next = nil
  end
end

def delete_request(r,t)
  if r.title == t
    r.next
  else
    r.next = delete_request(r.next, t)
    r
  end
end

def make_cycle(list)
  last = last_request(list)
  last.next = list
  list
end


def last_request(r)
  if r.next == nil
    r
  else
    last_request(r.next)
  end
end

def add_request(r,s)
  last = last_request(r)
  last.next = s
end

def play(name)
  puts("It starts playing a song titled `"+ name + ".'")
end

# version 1.6
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
