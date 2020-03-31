file = URI.open("url")
  beer1 = Beer1.find(1)
  beer1.avatar.attach(io: file, filename: 'Urubu Citra-Galaxy-Mosaïc', content_type: "image/png")
  beer1.save!
