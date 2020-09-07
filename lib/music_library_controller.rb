class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_input = gets
    while user_input != "exit"
      user_input = gets
    end
  end
  
  def list_songs
    Song.all.sort_by {|song| song.name}.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each_with_index {|artist, index| puts "#{index+1}. #{artist.name}"}
  end
  
  def list_genres
    Genre.all.sort_by {|genre| genre.name}.each_with_index {|genre, index| puts "#{index+1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets
    if Artist.find_by_name(user_input)
      Artist.find_by_name(user_input).songs.sort_by {|song| song.name}.each_with_index {|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets
    if Genre.find_by_name(user_input)
      Genre.find_by_name(user_input).songs.sort_by {|song| song.name}.each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name}"}
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.to_i
    if user_input.between?(1, Song.all.count)
      song_choice = Song.all.sort_by {|song| song.name}[user_input-1]
      puts "Playing #{song_choice.name} by #{song_choice.artist.name}"
    end
  end
  
  
  
  
    
  
  
  
end