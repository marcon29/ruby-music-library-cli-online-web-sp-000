class MusicImporter
  attr_accessor :path, :filename

  # each instance is a directory of music files
  def initialize(path)
    @path = path
    binding.pry
  end


end
