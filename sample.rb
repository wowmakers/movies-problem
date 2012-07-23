
# This is a sample file with only the outline of the program to get you
# started if you're using Ruby. Edit this file and modify the code to get the
# correct output.

require 'json' # `gem install json` if you don't already have json gem installed

raw_json = IO.read('data/movies.json')

# Parse the JSON data to get movie details

genres = ['Thriller']   # Collect the genre names here.

# Print the ratings and genre names
genres.each do |genre|
  avg_rating = 8    # get the average rating for all the films of the genre
  puts "%0.2f #{genre}" % avg_rating
end
