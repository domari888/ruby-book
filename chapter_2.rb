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

# 数値クラスのあれこれ
## Integerクラス(整数)
p 10.class
#=> Integer

## Floatクラス(小数)
p 1.5.class
#=> Float

## Rationalクラス(有理数リテラル)
p r = 2 / 3r
#=> (2/3)
p r.class
#=> Rational

## Complexクラス(複素数リテラル)
p c = 0.3 - 0.5i
#=> (0.3-0.5i)
p c.class
#=> Complex

# ----- &&や||の戻り値と評価を終了するタイミング -----
## 式全体の真偽を評価して、最後に評価した式の値を戻り値として返す
### 3 を評価した時点で真偽が確定する(真)
p 1 && 2 && 3
#=> 3

### nil を評価した時点で真偽が確定する(偽)
p 1 && nil && 3
#=> nil

### false を評価した時点で真偽が確定する(偽)
p 1 && false && 3
#=> false

### false を評価した時点で真偽が確定する(偽)
p nil || false
#=> false

### nil を評価した時点で真偽が確定する(偽)
p false || nil
#=> nil

### 2 を評価した時点で真偽が確定する(真)
p nil || false || 2 || 3
#=> 2

# ----- 優先順位が低い and, or, not -----
t1 = true
t2 = true
f1 = false

## !は優先順位が高いため !(f1) || t1 となる
!f1 || t1
#=> true

## notは優先順位が低いため not(f1 || t1)となる
not f1 || t1
#=> false

## && は || よりも優先順位が高いため t1 or (t2 and f1) となる
t1 || t2 && f1
#=> true

## and or は優先順位に違いがないため (t1 or t2) and f1 となる
t1 or t2 and f1
#=> false

# ----- unless 文 -----
## else を使用して真だった場合の処理の書き方
status = 'ok'
unless status == 'ok'
  '異常が発生しました'
else
  '正常です'
end
#=> '正常です'

# ----- == true や == false は冗長使わないようにする -----
string = ''
if string.empty?
  '空文字です'
end

## true や false そのものである事を判断するときは使用する
some_value = true
if some_value == true
  'true です'
end

# ----- case 文 -----
country = 'italy'
case country
when 'japan'
  'こんにちは'
when 'us'
  'Hello'
when 'italy'
  'Ciao'
else
  '???'
end
#=> 'Ciao'

## when節に複数の値を指定する
country = 'イタリア'
case country
when 'japan', '日本'
  'こんにちは'
when 'us', 'アメリカ'
  'Hello'
when 'italy', 'イタリア'
  'Ciao'
else
  '???'
end
#=> 'Ciao'

## case文で評価された式の戻り値を変数に代入する
country = 'italy'
message =
  case country
  when 'japan'
    'こんにちは'
  when 'us'
    'Hello'
  when 'italy'
    'Ciao'
  else
    '???'
  end
p message
#=> 'Ciao

## when節をワンライナーで書く
country = 'italy'
case country
when 'japan' then 'こんにちは'
when 'us' then 'Hello'
when 'italy' then 'Ciao'
else '???'
end
#=> 'Ciao

# ----- 三項演算子 -----
## 評価された式の戻り値を変数に代入する
n = 11
message = n > 10 ? '10より大きいです' : '10以下です'
p message

# ----- デフォルト値付きの引数 -----
def greet(country = 'japan')
  if country == 'japan'
    p 'こんにちは'
  else
    p 'Hello'
  end
end

greet
#=> 'こんにちは'
greet('us')
#=> 'Hello'

## デフォルト値ありとデフォルト値なしの引数を混在させる
def default_args(a, b, c = 0)
  "a=#{a}, b=#{b}, c=#{c}"
end

default_args(1, 2)
#=> 'a=1, b=2, c=0'
default_args(1, 2, 3)
#=> 'a=1, b=2, c=3'

## 動的に変わる値をデフォルト値に指定する
def current_time(time = Time.now)
  p "time: #{time}"
end

current_time
#=> 'time: 2022-09-26 23:52:38 +0900'

## メソッドの戻り値をデフォルト値に指定する
def foo(message = bar)
  p "message: #{message}"
end

def bar
  'BAR'
end

foo
#=> 'message: BAR'

## 左にある引数をデフォルト値に指定する
def point(x, y = x)
  p "x=#{x}, y=#{y}"
end

point(5)
#=> 'x=5, y=5'
point(3, 10)
#=> 'x=5, y=10'

# ----- ?で終わるメソッド -----
## 空文字であれば true、それ以外は false
''.empty?
#=> true
'aaa'.empty?
#=> false

## 引数の文字列が含まれていれば true, それ以外は false
'abc'.include?('ab')
#=> true
'abc'.include?('abd')
#=> false

## 奇数であれば true、偶数であれば false
1.odd?
#=> true
2.odd?
#=> false

## 偶数であれば true、奇数であれば false
1.even?
#=> false
2.even?
#=> true

## オブジェクトが nil であれば true、それ以外は false
nil.nil?
#=> true
'aaa'.nil?
#=> false
1.nil?
#=> false
''.nil?
#=> false

## ?で終わるメソッドを定義する
def multiple_of_three?(n)
  n % 3 == 0
end

multiple_of_three?(4)
#=> false
multiple_of_three?(6)
#=> true

# ----- !で終わるメソッド -----
stiring_ruby = 'ruby'

## 変数 string は変化しない
string.upcase
#=> 'RUBY'
string
#=> 'ruby'

## 変数 string も変化する
string.upcase!
#=> 'RUBY'
string
#=> 'RUBY'

## !で終わるメソッドを定義する
string_rails = 'rails'

def reverse_upcase!(string_rails)
  string_rails.reverse.upcase
end

reverse_upcase!(string_rails)
#=> 'SLIAR'
string_rails
#=> 'SLIAR'

