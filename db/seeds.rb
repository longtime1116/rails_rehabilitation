# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
(1..3).each do |i|
  SetupUserService.call({ name: "user_#{i}", email: "user_#{i}@example.com", password: 'hoge',
                          password_confirmation: 'hoge' })
end
SetupUserService.call({ name: 'hoge', email: 'hoge@example.com', password: 'hoge', password_confirmation: 'hoge' })
