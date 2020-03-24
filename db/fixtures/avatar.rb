require 'faker'

10.times do
avatarArray = [Faker::Avatar.image]
end
new_pic = User.find(2)
new_pic.avatar.attach(io: avatarArray[0], filename: 'beer2.png', content_type: "image/png")
new_pic.save!
