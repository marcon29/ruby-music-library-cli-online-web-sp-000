class MusicImporter
  attr_accessor :path  #, :filename

  # each instance is a directory of music files
  def initialize(path)
    @path = path
    #binding.pry
  end

# puts all files in directory at @path in an array
  def files
    Dir.children(path)
  end

  def self.new_from_filename
    self.files.each do |filename|
      artist_name = filename.split(" - ")[0]
      song_name = filename.split(" - ")[1]
      genre_name = filename.split(" - ")[2].split(".")[0]

      Song.new(artist_name)
    end
  end

  def self.import
  end

end
