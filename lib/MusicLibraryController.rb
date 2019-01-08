require "pry"
class MusicLibraryController

  extend Concerns::Findable

    ##initialize accepts one argument, the path to the MP3 files to be imported creates a new MusicImporter object, passing in the 'path' value the 'path' argument defaults to './db/mp3s'invokes the #import method on the created MusicImporter object
  def initialize(path = "./db/mp3s")
    new_importer_object = MusicImporter.new(path)
    new_importer_object.import
  end
  
  # call welcomes the user asks the user for input loops and asks for user input until they type in exit
    def call
    input = ""
    while input != "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip

      case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
    end
  end
  
  
  def list_songs

    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      end
=end
   #this gives you an array of song instances sorted by name alphabetically
    songs_sorted_by_name = Song.all.sort_by do |song|
      song.name
    end
    songs_sorted_by_name.each.with_index(1) do |song,index|
      puts "#{index}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

end