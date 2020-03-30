class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    genre_name = filename.split(" - ")[2].split(".")[0]

    self.new(song_name, artist_name, genre_name)
  end
#binding.pry


#  def self.find_by_name(name)
#    self.all.detect{ |s| s.name == name }
#  end

#  def self.find_or_create_by_name(name)
#    if self.find_by_name(name)
#      self.find_by_name(name)
#    else
#      self.create(name)
#    end
#  end



end
