def sign(x)
    if x < 0
	-1
    else
	if 0 < x
	    1    # not(x<0) and 0<x
	else
	    0	 # not(x<0) and not(0<x)
	end
    end
end

# version 1.2
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
