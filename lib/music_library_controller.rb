class MusicLibraryController

  def initialize(path="./db/mp3s")
    library = MusicImporter.new(path)
    library.import
  end

end
