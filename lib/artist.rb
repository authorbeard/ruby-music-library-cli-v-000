require 'pry'

class Artist
  attr_accessor :name, :song, :genre, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs =[]
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist ||= self
    @songs << song if songs.include?(song) == false
 
  end

  def find_or_create_by_name(name)
    @@all.detect{|artist| artist.name == name} || Artist.new(name)

  end

  def save
    @@all << self
  end
 
  def self.all 
    @@all
  end
 
  def self.destroy_all
    @@all.clear
  end   
end