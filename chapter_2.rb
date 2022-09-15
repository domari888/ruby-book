# %記法で文字列を作る
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
