user = User.new(email: 'admin@example.com',
                password: 'password'
)
user.skip_confirmation!
user.save