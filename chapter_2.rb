# --- %記法で文字列を作る ---
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


# --- ヒアドキュメント(行指向文字列リテラル) ---
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
