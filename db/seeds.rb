# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
users = (1..3).map do |i|
  User.new(name: "user_#{i}", email: "user_#{i}@example.com", password: 'hoge', password_confirmation: 'hoge')
end
User.import(users)
