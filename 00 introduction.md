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

### 範囲解説など

UTaisakuから。

* [H22冬学期情報科学シケプリ ver 1.1](http://todai.info/sikepuri/search/show.php?id=1193)

試験範囲の分かりやすいまとめです。復習向け。

* [電車の中で読もうと思えば読めないことはない情報科学シケプリ](http://todai.info/sikepuri/search/show.php?id=1194)

わりと踏み込んだ内容に触れています。ただ電車の中で読むのはかなり厳しいかと…。

* [第二学期 情報科学 一歩進んだプログラミングのために 補足とかいろいろ](http://todai.info/sikepuri/search/show.php?id=1037)(2009年度)

2009年度のシケプリですが、非常に詳細な内容に触れていて、なおかつ組版がきれいです。余力のある人の読み物向けです。

## Rubyの導入

各自のPCでRubyを使えるようにします。

情報教育等にインストールされているrubyのバージョンは1.8.7なので、それに合わせてインストールした方がいいでしょう。

### isrbごとインストール

isrbは東大独自の対話環境です。[ECCSのページ](http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/text/isrb/)でWindows用のインストーラーと、各環境向けの導入方法が公開されています。とりあえず筆者の環境(Windows 8 pro 64bit)でも動きました。

ただ、 Mac だとうまくいかないという話も散見します。

### Rubyだけをインストール(isrbは使えません)

Rubyだけをインストールするなら簡単です。ターミナルからrubyコマンドとirbコマンドが使えるようになります。

Mac OS X の場合、最初からruby 1.8.7がインストールされています。

Windows の場合、[RubyInstaller](http://rubyinstaller.org/)を使用することができます。[Download](http://rubyinstaller.org/downloads/)の「Ruby 1.8.7-p374」から入手し、説明に従ってインストールしてください。

Linux は・・・まあ適当にお願いします。

## 配布資料

先に言ったとおり、 http://lecture.ecc.u-tokyo.ac.jp/johzu/joho-kagaku/2013/ で配布されています。ただ配布プログラムについてひとこと言わせてもらうと、インデントにスペースとタブが混在してたり、変数名が一文字だったりいろいろとクズいです。