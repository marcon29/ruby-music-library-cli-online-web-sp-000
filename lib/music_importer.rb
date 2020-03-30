class MusicImporter
  attr_accessor :path, :filename

  # each instance is a directory of music files
  def initialize(path)
    @path = path
  end

  def files
    # puts all files in directory at @path in an array
  end

end
