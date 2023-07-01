# creates 5 users
5.times do
  User.create!(
    email: Faker::Internet.email,
    username: Faker::Internet.user_name,
    password: Faker::Internet.password
  )
end

# creates 10 posts
10.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph,
    user: User.all.sample
  )
end

