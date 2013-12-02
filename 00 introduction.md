情報科学シケプリ
================

# 00 introduction

東京大学 2013年度冬学期1年生 月4月5の伊知地宏教員の情報科学の講義のシケプリです。

とりあえず今回はこのようにMarkdownで書いていきます。

あとgitで管理します。たぶんgithubにも公開します。

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