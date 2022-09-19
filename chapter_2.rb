# ----- %記法で文字列を作る -----
## %q! ~ ! はシングルクオートで括ったことと同じ意味になる
puts %q!He said, "Hello."!
#=> He said, "Hello."

## %Q! ~ ! または %! ~ ! はダブルクオートで括ったことと同じ意味になる
something = "Hello."
puts %Q!He said, "#{something}"!
puts %!He said, "#{something}"!
#=> He said, "Hello."

## ?, ^, <>, {}, (), [] など任意の記号を区切り文字に使用することも可能
puts %q?He said, "Hello."?
puts %q^He said, "Hello."^
puts %q<He said, "Hello.">
puts %q{He said, "Hello."}
puts %q[He said, "Hello."]

# ----- ヒアドキュメント(行指向文字列リテラル) -----
## <<識別子 の形式で表示する
text = <<TEXT
ヒアドキュメントを用いた
文字列です
TEXT
puts text
#=> ヒアドキュメントを用いた
#   文字列です

## <<-識別子 の形式で識別子をインデントさせることができる
def identifier_indent
  <<-TEXT
ヒアドキュメントを用いた
文字列です
  TEXT
end
puts identifier_indent
#=> ヒアドキュメントを用いた
#   文字列です

## <<~識別子 の形式で文字列のインデント部分が無視されるようになる
def text_indent
  <<~TEXT
    ヒアドキュメントを用いた
    文字列です
  TEXT
end
puts text_indent
#=>   ヒアドキュメントを用いた
#     文字列です

## <<~識別子 の形式で文字列の行頭に半角スペースを入れる場合
def space_method
  <<~TEXT
    \  ヒアドキュメントを用いた
    \  文字列です
  TEXT
end
puts space_method
#=>   ヒアドキュメントを用いた
#     文字列です

## <<識別子 の形式で式展開する
name = 'hogehoge'
no_quart = <<TEXT
私の名前は#{name}です。
よろしく\nお願いいたします。
TEXT
puts no_quart
#=> 私の名前はhogehogeです。
#   よろしく
#   お願いいたします。

## <<"識別子" の形式で式展開する
single_quart = <<"TEXT"
私の名前は#{name}です。
よろしく\nお願いいたします。
TEXT
puts single_quart
#=> 私の名前はhogehogeです。
#   よろしく
#   お願いいたします。

## <<'識別子' の形式で式展開、埋め込み文字を無効にする
double_quart = <<'TEXT'
私の名前は#{name}です。
よろしく\nお願いいたします。
TEXT
puts double_quart
#=> 私の名前は#{hogehoge}です。
#   よろしく\nお願いいたします。

## ヒアドキュメントをメソッドの引数に渡す
text_a = 'Ruby'
text_a.prepend(<<TEXT)
Java
Python
TEXT
puts text_a
# #=> Java
#     Python
#     Ruby

## ヒアドキュメントに対してメソッドを呼び出す
text_b = <<~TEXT.upcase
Java
Python
TEXT
puts text_b
# #=> JAVA
#     PYTHON

## ヒアドキュメントを2つ同時に使用して配列を作る
text_c = [<<TEXT1, <<TEXT2]
Ruby
PHP
TEXT1
Ruby_on_Rails
Laravel
TEXT2
puts text_c[0]
#=> Ruby
#   PHP
puts text_c[1]
#=> Ruby_on_Rails
#   Laravel

# ----- フォーマットを指定して文字列を作成する -----
## 少数第3位まで表示する
p sprintf('%0.3f', 1.2)
p '%0.3f' % 1.2
#=> "1.200"

## 複数渡して表示する
p sprintf('%0.3f + %0.3f', 1.2, 0.48)
p '%0.3f + %0.3f' % [1.2, 0.48]
#=> "1.200 + 0.480"

# ----- 数値を文字列に変換 -----
p 12345.to_s
#=> "12345"

# ----- 配列を結合して文字列を作成する -----
p [10, 20, 30].join
#=> "102030"

# ----- String.new で文字列を作成する -----
p String.new('Hello!')
#=> "Hello!"

# ----- ダブルクオートと \u を使用して Unicode のコードポイントから文字列を作成する -----
## コードポイントを0で埋めて4桁にする
puts "\u0041"
#=> A

## \u{} の形式でコードポイントをそのまま記述する
puts "\u{41}"
#=> A

# ----- 基数指示子 -----
# 2進数で記述する場合(先頭に 0b をつける)
puts 0b11111111
#=> 255

# 8進数で記述する場合(先頭に 0 または 0o をつける)
puts 0377
puts 0o377
#=> 255

# 16進数で記述する場合(先頭に 0x をつける)
puts 0xff
#=> 255

# 10進数で記述する場合(先頭に 0d をつけて表示することもできる)
puts 255
puts 0d255
#=> 255

# ----- ビット演算 -----
## 論理積(AND) (どちらも1なら1を返す)
p sprintf '%#b', (0b1010 & 0b1100)
#=> "0b1000"

## 論理和(OR) (どちらかが1なら1を返す)
p sprintf '%#b', (0b1010 | 0b1100)
#=> "0b1110"

## 排他的論理和(XOR) (どちらか片方だけが1なら1を返す)
p sprintf '%#b', (0b1010 ^ 0b1100)
#=> "0b110"

## 右ビットシフト (スイッチのON/OFFの状態を、右に1個ずらす)
p sprintf '%#b', (0b1010 >> 1)
#=> "0b101"

## 左ビットシフト (スイッチのON/OFFの状態を、左に1個ずらす)
p sprintf '%#b', (0b1010 << 1)
#=> "0b10100"

## 論理反転(NOT) (0は1に、1は0に反転して返す)
p sprintf '%#b', ~0b0101
#=> "0b..10101" (..1は1が無限に続くことを表す)

# ----- 指数表現 -----
## 2 x 10⁻³ を表現する
p 2e-3
#=> 0.002

## 3 x 10⁴ を表現する
p 2e+4
#=> 20000.0