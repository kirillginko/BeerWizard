file = URI.open('https://res.cloudinary.com/guillaume1983/image/upload/v1584205751/Beer_wizard/Urubu-Citra-Galaxy-Mosai%CC%88c_kovucx.png')
  new_image = Beer.find(1)
  new_image.avatar.attached(io: file, filename: 'Urubu-Citra-Galaxy-Mosaïc.png', content_type: "image/png")
  new_image.save!

file = URI.open('https://res.cloudinary.com/guillaume1983/image/upload/v1584205751/Beer_wizard/Sir-Wallace-Hivernale_onlbok.png')
  new_image = Beer.find(2)
  new_image.avatar.attached(io: file, filename: 'Sir-Wallace-Hivernale.png', content_type: "image/png")
  new_image.save!
