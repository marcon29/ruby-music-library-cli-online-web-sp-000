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
    all_genres = []
    self.songs.each do |s|
      if !all_genres.include?(s.genre)
        all_genres << s.genre
      end
    end
    all_genres
  end


end
