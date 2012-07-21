
# This is a sample file with only the outline of the program to get you
# started if you're using Ruby. Edit this file and writing 

require 'json' # `gem install json` to get this to work

raw_json = IO.read('data/movies.json')

# Parse the JSON data to get movie details

genres = ['Thriller']   # => load all the unique genre names (sorted)

# Print the ratings and genre names
genres.each do |genre|
  avg_rating = 8    # get the average rating for all the films of the genre
  puts "%0.2f #{genre}" % avg_rating
end
