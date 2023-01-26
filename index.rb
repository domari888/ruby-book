class User
  def initialize(name)
    @name = name
  end

  # クラスメソッド
  def self.create_users(names)
    names.map{ |name|
      User.new(name)
    }
  end

  # インスタンスメソッド
  def greet
    "Hello, #{@name}!"
  end 
end

names = ['user1', 'user2', 'user3']

# クラスメソッド呼び出し
users = User.create_users(names)

# インスタンスメソッド呼び出し
users.each do |user|
  puts user.greet
end
