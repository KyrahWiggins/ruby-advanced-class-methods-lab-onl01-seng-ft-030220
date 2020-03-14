
class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by { |obj| obj.name }
  end

  def self.new_from_filename(file)
    song_artist_array = file.gsub!(/.mp3/, "").split(" - ")
    song = self.new_by_name(song_artist_array[1])
    song.artist_name = song_artist_array[0]
    song
  end

  def self.create_from_filename(file)
    song_artist_array = file.gsub!(/.mp3/, "").split(" - ")
    song = self.create_by_name(song_artist_array[1])
    song.artist_name = song_artist_array[0]
    song
  end

  def self.all
    @@all
  end
    self.class.all << self
  end


  def self.destroy_all
    @@all.clear
  end
end
