require('pry')

require_relative('../models/album')
require_relative('../models/artist')

artist1 = Artist.new({"name" => "Ween"})
artist1.save


binding.pry
nil
