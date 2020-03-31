class MusicLibraryController
  attr_accessor :library

  def initialize(path="./db/mp3s")
    @library = MusicImporter.new(path).import
    #MusicImporter.new(path).import
  end

  def call
    input = ""

    while input != "exit"
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
    end
  end

  def list_songs
    #first try
    #sorted_lib = library.sort_by { |s| s.scan(/- .+ -/) }
    #sorted_lib.each_with_index { |s, i| puts "#{i+1}. #{s.chomp(".mp3")}"}

    #second try
    #lib = Song.all.collect { |s| "#{s.artist.name} - #{s.name} - #{s.genre.name}" }
    #sorted_lib = lib.sort_by { |s| s.scan(/- .+ -/) }
    #sorted_lib.each_with_index { |n, i| puts "#{i+1}. #{n}"}

    # school solution
    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
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
    if results = Artist.find_by_name(input)
      song_list = results.songs.collect { |s| "#{s.name} - #{s.genre.name}" }
      song_list.sort.each_with_index { |s, i| puts "#{i+1}. #{s}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if results = Genre.find_by_name(input)
      sorted = results.songs.sort { |a, b| a.name <=> b.name }
      sorted.each_with_index { |s, i| puts "#{i+1}. #{s.artist.name} - #{s.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
#    if !input.between?(1, library.count)
#      play_song
#    else
      song = list_songs[input-1].name#.split(" - ")[1]
      artist = list_songs[input-1].artist.name#split(" - ")[0]
      puts "Playing #{song} by #{artist}"
#    end
binding.pry
  end

end
