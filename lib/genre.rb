class Genre
  extend Concerns::Findable
  
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
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end

  def add_song(song)
    if song.genre == self
      if !@songs.find {|s| s == song}
        @songs << song
      end
    elsif !song.genre
      song.genre = self
    end
  end

  def artists
    all_artists = []
    self.songs.each do |s|
      if !all_artists.include?(s.artist)
        all_artists << s.artist
      end
    end
    all_artists
  end


end
