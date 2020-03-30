class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    new_artist = self.new(name)
    new_artist.save
    new_artist
  end

  # adds song instances to songs tracker
  def add_song(song)
    @songs << song.artist
  end

#Song.new("Window", "Neutral Milk Hotel").save
#Song.new("Sorry", "SC").save
end
