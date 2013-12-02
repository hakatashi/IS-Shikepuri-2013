情報科学シケプリ
================

# 00 introduction

## 凡例

rubyのコードは以下のように記述します。

```ruby
require 'kconv'

class HelloWorldClass
  def SayHelloWorld
    puts("Hello, World!")
  end
end

HelloWorld = HelloWorldClass.new
HelloWorld.SayHelloWorld
```

irb, isrbからの出力は以下のように記述します。

```
irb(main):001:0> for i in 0..3
irb(main):002:1> str = "Hello, " + "World!\n"
irb(main):003:1> print(str)
irb(main):004:1> end
Hello, World!
Hello, World!
Hello, World!
Hello, World!
=> 0..3
```

インデントは慣習にならい半角スペース2つで記述します。

句読点がどうとかそういうことはまったく気にしてません。

## 概要

本講義で学習するのはrubyの基本中の基本と、計算機を使用した数値計算とアルゴリズムの基本(らしい)です。

このシケプリではおもに講義中でわかりにくそうなところの補足と、練習問題とレポート課題の回答を掲載する予定です。

## 便利なリンク

このシケプリに頼る前にまずはこちらを漁ってみてください。

### 過去問

東大の[情報科学共通試料](http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/2013/)で公開されています。

### 過去問解説

UTaisakuから。

* [情報科学 2010年度 冬学期 解答＆解説](http://todai.info/sikepuri/search/show.php?id=944)
* [2011年情報科学解答](http://todai.info/sikepuri/search/show.php?id=1606)
* [情報科学 2011年度 共通問題 解答例・解説](http://todai.info/sikepuri/search/show.php?id=1617)

※共通資料のページにあるとおり、2009年度以前の試験は範囲が大きく異なります。