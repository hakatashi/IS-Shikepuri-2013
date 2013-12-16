# sum of divisors of k in between 1 and n
load("./divisible.rb")

def sod(k,n)
    if n >= 2
        if divisible(k,n)
            sod(k,n-1)+n
        else
            sod(k,n-1)
        end
    else
        1
    end
end
# version 1.2
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
