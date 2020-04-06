require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def self.create
    song = self.new 
    song.save 
    return song 
  end 
  
  def save
    self.class.all << self
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
    self.all.find do |song|
      song.name == name 
    end 
  end 
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
       self.find_by_name(name)
    else 
        self.create_by_name(name)
    end 
  end 
  
  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end 
  end 
  
  def self.new_from_filename(filename)
    artist_song = filename.chomp('.mp3').split(' - ')
    name = artist_song[0]
    artist_name = artist_song[1]
    song = self.new
    song.name = name
    song.artist_name = artist_name
  end

  def self.create_from_filename(filename)
    artist_song = filename.chomp('.mp3').split(' - ')
    name = artist_song[1]
    song = self.create_by_name(name)
    self.find_by_name(name)
    song.artist_name = artist_song[0]
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
end