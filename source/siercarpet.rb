# カントール集合のプログラムの焼き直しです。

load("./make2d.rb")

def siercarpet(n)
  a = make2d(3**n, 3**n)
  subsiercarpet(a, n, 0, 0)
  show(a)
end

# a という配列に (x, y) を左上隅とする n 次のシェルピンスキーのカーペットを生成する関数
def subsiercarpet(a, n, x, y)
  # 0次なら単純に一個塗りつぶすだけ
  if n == 0
    a[x][y] = 1
  else # 0次でないなら、いっこ下の次元のサブカーペットを呼び出す
    # 3x3のサブカーペットが必要なので、x方向とy方向にその回数ずつだけループさせる
    for carpX in 0..2 do
      for carpY in 0..2 do
        # まんなかの一個を除く
        if carpX != 1 || carpY != 1
          # サブカーペットを帰納的に呼び出します。
          # 左上隅の計算部分がちょっとややこしいかもしれません。
          # なお、rubyでは乗算(*)より冪乗(**)が優先されます。
          subsiercarpet(a, n - 1, x + carpX * 3 ** (n-1), y + carpY * 3 ** (n-1))
        end
      end
    end
  end
end

