require('pry')

require_relative('../models/album')
require_relative('../models/artist')

Album.delete_all
Artist.delete_all

artist1 = Artist.new({"name" => "Ween"})
artist1.save

artist2 = Artist.new({"name" => "Death Grips"})
artist2.save

album1 = Album.new({
  "title" => "Chocolate and Cheese",
  "genre" => "Alternative",
  "artist_id" => artist1.id
  })
album1.save

album2 = Album.new({
  "title" => "God Ween Satan",
  "genre" => "Alternative",
  "artist_id" => artist1.id
  })
album2.save

album3 = Album.new({
  "title" => "The Money Store",
  "genre" => "Hip Hop",
  "artist_id" => artist2.id
  })
album3.save

Artist.find_by_id(artist1.id)
Album.find_by_id(album3.id)

Album.list_all
Artist.list_all

artist1.list_all_albums
album1.artist

album3.title = "No Love Deep Web"
album3.update

artist1.name = "Limp Biscuit"
artist1.update

album3.delete
artist2.delete

binding.pry
nil
