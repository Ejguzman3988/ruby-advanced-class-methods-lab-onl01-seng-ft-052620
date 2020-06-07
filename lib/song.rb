require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  

  def self.create

    song = self.new

    song.save

    song

  end

  def self.new_by_name(name)

    song_by_name = self.new
    song_by_name.name = name
    song_by_name
  end

  def self.create_by_name(name)

    song = self.new
    song.name = name
    song.save
    song


  end


  def self.find_by_name(name)
  
    self.all.find { |obj| obj.name == name }
    
  end

  def self.find_or_create_by_name(name)

    self.find_by_name(name) || self.create_by_name(name)

  end

  def self.alphabetical
    self.all.sort_by{ | song | song.name }
  end

  def self.new_from_filename(file_name)
    
   
    name_array = file_name.split(".mp3").join.split(" - ")
    song = self.create_by_name(name_array[1])
    song.artist_name = name_array[0]

    song
    
    
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
    
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

end
