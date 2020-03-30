class MusicImporter
  attr_accessor :path  #, :filename

  # each instance is a directory of music files
  def initialize(path)
    @path = path
  end

# puts all files in directory at @path in an array
  def files
    Dir.children(path)
  end

  def self.import
    self.files.each do |filename|
      Song.create_from_filename(filename)
    end
  end

end
