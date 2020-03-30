class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []     #array of song instances related to artist instance
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
    #binding.pry
    if song.artist == self
      if !@songs.find {|s| s == song}
        @songs << song
      end
    #elsif !song.artist
    #  song.artist = self
    end
  end

#Song.new("Window", "Neutral Milk Hotel")
#Song.new("Sorry", "SC")
#Song.new("Hurt", )
#Artist.new("SC")

end
