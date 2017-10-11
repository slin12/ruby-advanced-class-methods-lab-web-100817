require 'pry'

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
    new_song.save
    self.all.find {|song| song = new_song}
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    mp3_removed = filename.match(/[\w\s-]+/)[0]
    split = mp3_removed.split(" - ")
    new_song = Song.new
    new_song.name = split[1]
    new_song.artist_name = split[0]
    new_song
  end

  def self.create_from_filename(filename)
    mp3_removed = filename.match(/[\w\s-]+/)[0]
    split = mp3_removed.split(" - ")
    new_song = Song.new
    new_song.name = split[1]
    new_song.artist_name = split[0]
    new_song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
