class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil)
    @name = name
    @name = artist
  end


#  def artist=(artist=nil)
#    if artist
#      @artist = artist
#      Artist.add_song
#    end
#  end



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
