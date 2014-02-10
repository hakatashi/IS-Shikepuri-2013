# スライド資料の組み合わせプログラムとほぼ同じです。

load("./make2d.rb")

def sierpinski(n)
  a = make2d(n, n)
  a[0][0] = 1
  for x in 1..n-1
    a[x][0] = 1
    for y in 1..(x-1)
      # x-1Cy-1 の余りと x-1Cy の余りを足して、 xCy を2で割った余りを求める。
      # modの性質によりそのまま加算できる。
      # a[x][y] = (a[x-1][y-1] + a[x-1][y]) % 2
      # などでもいいが、xorを使うとシンプルに書ける。
      a[x][y] = a[x-1][y-1] ^ a[x-1][y]
    end
    a[x][x] = 1
  end
  show(a)
end
