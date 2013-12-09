def matmul(a, b)
  [
    [
      a[0][0] * b[0][0] + a[0][1] * b[1][0],
      a[0][0] * b[0][1] + a[0][1] * b[1][1]
    ], [
      a[1][0] * b[0][0] + a[1][1] * b[1][0],
      a[1][0] * b[0][1] + a[1][1] * b[1][1]
    ]
  ]
end

def matsquare(a)
  matmul(a, a)
end

def matpower(a, n)
  if n == 0
    [[1, 0], [0, 1]]
  elsif n % 2 == 0
    matsquare(matpower(a, n / 2))
  else
    matmul(matpower(a, n - 1), a)
  end
end
