class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end

  def self.find_by_name(name)
     self.all.detect{|song| song.name == name}
   end

  def save
    self.class.all << self
  end

   def self.find_or_create_by_name(name)
     song = self.find_by_name(name)
     if song then
        return song
      else
        self.create_by_name(name)
      end
    end

  # def self.alphabetical
  #   sort=[]
  #   new=[]
  #   i=0
  #     while i< @@all.length
  #       # puts @@all[i].name
  #       sort[i]=@@all[i].name
  #       i+=1
  #   end
  #   sort=sort.sort!
  #   # puts sort
  #   # @@all.clear
  #   i=0
  #   while i < sort.length
  #     # puts sort[i]
  #     new <<  Song.find_by_name(sort[i])
  #     i+=1
  #   end
  #   return new
  # end
    def self.alphabetical
      self.all.sort_by{|s| s.name}
    end
 def self.new_from_filename(filename)
          array=[]
          new_ar=[]
          array=filename.split("- ")
          artist_name=array[0]
          # @artist_name=artist_name
          new_ar=array[1].partition(".")
          name=new_ar[0]
          song = self.new
          song.artist_name = artist_name
           @@all << song
            song = self.new
          song.name = name
          @@all << song
         return @@all
   end
end
# song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")
# Song.create_from_filename("Thundercat - For Love I Come.mp3")
song_1 = Song.create_by_name("Thriller")
      song_2 = Song.create_by_name("Blank Space")
      song_3 = Song.create_by_name("Call Me Maybe")
Song.alphabetical
