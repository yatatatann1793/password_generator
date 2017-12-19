require_relative "./password_generator"

generator = PasswordGenerator.new(length: 8)

puts "パスワードを生成します "
puts "----*"*10
puts generator.run
puts "----*"*10