file = URI.open("https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60")
  user2 = User.find(2)
  user2.avatar.attach(io: file, filename: 'Steve', content_type: "image/png")
  user2.save!
