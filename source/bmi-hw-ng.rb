# BMI of a person with height (cm) and weight (kg)
def bmi(height,weight)
  weight / (height/100.0) ** 2
end
h=188.0		# これらの代入命令はloadされたときに
w=104.0		# は効果がない

# version 1.1
# see http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/
