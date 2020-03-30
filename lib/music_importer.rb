class MusicImporter
  attr_accessor :path  #, :filename

  # each instance is a directory of music files
  def initialize(path)
    @path = path
  end

# puts all files in directory at @path in an array
  def files
    Dir.children(path)
  end

  def self.import
    self.files.each do |filename|
      artist_name = filename.split(" - ")[0]
      song_name = filename.split(" - ")[1]
      genre_name = filename.split(" - ")[2].split(".")[0]

      Song.new_from_filename(artist_name)
    end
  end

end
