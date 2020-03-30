class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  # creating song adds song_name (string) and artist_instance (via custom setter)
  def initialize(name, artist=nil)
    @name = name
    if artist
      self.artist = artist
    end
  end

  # creating song adds song_name (string) and artist_instance (via custom setter)
  def artist=(artist)
    #@artist = artist
    artist.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end
end
