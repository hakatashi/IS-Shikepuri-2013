情報科学シケプリ
================

# 第一回リポート

```
 課題1: 連立1次方程式の解法
    Pivoting 付き Gauss-Jordan 法のプログラムを完成させなさい．
```

## 注意

```
学生支援課はTwitterを監視しています
```

剽窃はバレないようにやりましょう。ここで一般公開しているプログラムを丸写しするのはだいぶ危険な類だと思いますよ。

ここでは最初に方針を提示し、完成したプログラムは一番最後に掲載しています。

## gjp.rbを見る

配布資料のgjp.rbには以下のように書かれています。（汚いインデントを整形してあります）

```ruby
load("./abs.rb")
load("./swap.rb")

def maxrow(a,k)
  # a[i][k]の絶対値が最大となるi>=kを探す
end

def gjp(a) # Gauss-Jordan method WITH pivoting
  row = a.length()
  col = a[0].length()
  for k in 0..(col-2)
    max=maxrow(a,k) # find absolute-maximal coeff. 
    swap(a,k,max)   # swap rows
    akk = a[k][k]
    for i in 0..(col-1)       # normalize row k
      a[k][i]=a[k][i]*1.0/akk
    end
    for i in 0..(row-1)       # eliminate column k
      if i != k               # of all rows but k
        aik = a[i][k]
        for j in k..(col-1)
          a[i][j] = a[i][j] - aik * a[k][j]
        end
      end
    end
  end
  a
end
```

このプログラムの未完成な点は、

1. maxrow関数の"a[i][k]の絶対値が最大となるi>=kを探す"部分のプログラムが書かれていない
2. loadで他ファイルの関数を読み込んでいる(swap.rbは配布資料で配布されているが処理が異なる。abs.rbは配布されていない)

です。

とりあえずここではloadを使用しない方法を書きます。

## 全体的な枠組み

abs関数を定義し、swap関数を展開します。

```ruby
def abs(n)
  # nの絶対値を求める
end

def swap(a,i,j)
  v = a[i]
  a[i] = a[j]
  a[j] = v
end

def maxrow(a,k)
  # a[i][k]の絶対値が最大となるi>=kを探す
end

def gjp(a) # Gauss-Jordan method WITH pivoting
  row = a.length()
  col = a[0].length()
  for k in 0..(col-2)
    max=maxrow(a,k) # find absolute-maximal coeff. 
    swap(a,k,max)   # swap rows
    akk = a[k][k]
    for i in 0..(col-1)       # normalize row k
      a[k][i]=a[k][i]*1.0/akk
    end
    for i in 0..(row-1)       # eliminate column k
      if i != k               # of all rows but k
        aik = a[i][k]
        for j in k..(col-1)
          a[i][j] = a[i][j] - aik * a[k][j]
        end
      end
    end
  end
  a
end
```

## abs関数

abs関数といえばふつう絶対値を求める関数を指します。maxrow関数で絶対値の導出が必要になるので先にこの関数を定義します。

方針としては、

* 与えられた値が正かどうかで条件分岐し、正なら値をそのまま返し、正でないなら符号を反転させた値を返す
* Numeric.absメソッドを使用する

とあると思いますが、まあおとなしく1.で手動実装するとよいでしょう。

条件分岐は`if..else..end`文、符号の反転は`-n`で大丈夫です。

## maxrow関数

指定されたとおり、`a[i][k]`の絶対値が最大となる`i`(>=k)を探す操作をします。

方針としては、以下のとおりです。`a[i][k]`の`i`の部分を`k`から配列の最後まで順番に変えながら、それまで見てきた中で一番大きな絶対値を変数(例えば`max`)として記録し、同時にその時の`i`の値を別の変数(例えば`maxrow`)に記録します。その操作が終わった後の`maxrow`の値を出力する、というのが一番楽だと思います。

`i`の部分を順番に変えながら…という部分は`for`文を使います。配列の最後の番号は`a.length()-1`で調べられます。(`a.length()`は配列の長さ)

## 最終的なプログラム

```ruby
def abs(n)
  if n > 0
    n
  else
    -n
  end
end

def swap(a,i,j)
  v = a[i]
  a[i] = a[j]
  a[j] = v
end

def maxrow(a,k)
  max = abs(a[k][k])
  maxrow = k
  for i in k..(a.length()-1)
    if max < abs(a[i][k])
      max = abs(a[i][k])
      maxrow = i
    end
  end
  maxrow
end

def gjp(a) # Gauss-Jordan method WITH pivoting
  row = a.length()
  col = a[0].length()
  for k in 0..(col-2)
    max = maxrow(a,k) # find absolute-maximal coeff. 
    swap(a,k,max)   # swap rows
    akk = a[k][k]
    for i in 0..(col-1)       # normalize row k
      a[k][i]=a[k][i]*1.0/akk
    end
    for i in 0..(row-1)       # eliminate column k
      if i != k               # of all rows but k
        aik = a[i][k]
        for j in k..(col-1)
          a[i][j] = a[i][j] - aik * a[k][j]
        end
      end
    end
  end
  a
end
```

動作確認

```
irb(main):001:0> require("./gj.rb")
=> true
irb(main):002:0> gj([[1, -50, -3, -90], [-85, 2, -25, -6], [79, 5, 30, -1]])
=> [[1.0, 0.0, 0.0, 0.9999999999999775], [-0.0, 1.0, 0.0, 1.999999999999997], [0.0, 0.0, 1.0, -2.999999999999955]]
irb(main):003:0> require("./gjp.rb")
=> true
irb(main):004:0> gjp([[1, -50, -3, -90], [-85, 2, -25, -6], [79, 5, 30, -1]])
=> [[1.0, 0.0, 0.0, 1.0000000000000002], [-0.0, 1.0, 0.0, 2.0], [0.0, 0.0, 1.0, -3.0]]
```