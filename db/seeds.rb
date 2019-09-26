users_number = 15

common_data = { password: 'password', confirmed_at: Time.now }
users_list = [{ email: 'test@example.com' }.merge(common_data)]
(users_number - 1).times do |n|
  users_list << { email: "test-#{sprintf('%02d', n + 2)}@example.com" }.merge(common_data)
end

User.create!(users_list)