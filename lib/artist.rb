class Artist
  attr_accessor :name, :songs, :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    @genres = []
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

  def add_song(song)
    if song.artist == self
      if !@songs.find {|s| s == song}
        @songs << song
      end
    elsif !song.artist
      song.artist = self
    end
  end

  def genres
    # search through song list
    # pull out each genre and add to genre list if not already in it
    @songs.
    @genre << genre
    genre.add_song(self)
  end
  
end
