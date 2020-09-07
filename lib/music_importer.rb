class MusicImporter
  
  attr_reader :path
  
  def initialize(path)
    @path = path
  end

  
  def files
    # Dir.entries(@path)
    Dir[@path+"/*.mp3"].map { |file| file.split("/").last}
  end
  
  def import
    files.each { |file| Song.create_from_filename(file)}
  end

end