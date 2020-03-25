require 'faker'

#10.times do
#avatarArray = [Faker::Avatar.image]
#end
#p avatarArray
#new_pic = User.find(2)
#new_pic.avatar.attach(io: Faker::Avatar.image, filename: 'beer2.png', content_type: "image/png")
#new_pic.save!

file = URI.open(Faker::Avatar.image)
  new_image = User.find(2)
  new_image.avatar.attach(io: file, filename: 'Melissa', content_type: "image/png")
  new_image.save!

p Faker::Avatar.image
