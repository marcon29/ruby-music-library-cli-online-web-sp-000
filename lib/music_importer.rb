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

  def self.new_from_filename
    # creates song intance using info from filename
    # need to parse filename for song_name, artist_name, genre_name
  end

  def self.import
  end

end
