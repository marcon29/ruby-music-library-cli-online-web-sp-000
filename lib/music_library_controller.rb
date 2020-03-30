class MusicLibraryController
  attr_accessor :library

  def initialize(path="./db/mp3s")
    @library = MusicImporter.new(path).import
  end

  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

    input = gets.strip

    self.call unless input == "exit"
  end

  def list_songs
    sorted_lib = library.sort_by { |s| s.scan(/- .+ -/) }
    sorted_lib.each_with_index { |s, i| puts "#{i+1}. #{s.chomp(".mp3")}"}
  end

  def list_artists
    names = Artist.all.collect { |a| a.name }
    names.sort.each_with_index { |n, i| puts "#{i+1}. #{n}"}
  end

  def list_genres
    genre_names = Genre.all.collect { |g| g.name }
    genre_names.sort.each_with_index { |n, i| puts "#{i+1}. #{n}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    results = Artist.find_by_name(input)
    puts results
    #song_list = results.songs.collect { |s| "#{s.name} - #{s.genre.name}" }
    #song_list.sort.each_with_index { |s, i| puts "#{i+1}. #{s}"}
#binding.pry
  end

  def list_songs_by_genre
  end

  def play_song
  end

end
