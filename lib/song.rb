class Song
	attr_accessor :name, :artist_name
  	@@all = []

  	def self.all
    	@@all
  	end

  	def save
    	self.class.all << self
  	end

  	def self.create
    	new_song = self.new
    	@@all << new_song
    	new_song
  	end

  	def self.new_by_name(song_name)
    	new_song = self.new
    	new_song.name = song_name
    	new_song
  	end

  	def self.create_by_name(song_name)
    	new_song = self.new
		new_song.name = song_name
		@@all << new_song
    	new_song
  	end

  	def self.find_by_name(song_name)
		self.all.detect { |song| song.name == song_name }
  	end

  	def self.find_or_create_by_name(song_name)
		self.find_by_name(song_name) || self.create_by_name(song_name)
	end
	
	def self.alphabetical
		self.all.sort_by {|song| song.name}
	end

	def self.new_from_filename(filename)
		info = filename.split(" - ")
		artist = info[0]
		song_name = info[1].chomp(".mp3")
		
		song = self.new
		song.name = song_name
		song.artist_name = artist
		song
	end

	def self.create_from_filename(filename)
		info = filename.split(" - ")
		artist = info[0]
		song_name = info[1].chomp(".mp3")

		song = self.create
		song.name = song_name
		song.artist_name = artist
		song
	end

	def self.destroy_all
		@@all = []
	end

end

