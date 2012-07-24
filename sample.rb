
# This is a sample file with only the outline of the program to get you
# started if you're using Ruby. Edit this file and modify the code to get the
# correct output.

require 'json' # `gem install json` if you don't already have json gem installed

raw_json = IO.read('data/movies.json')

# Parse the JSON data to get movie details
movies = JSON.parse(raw_json)['movies']

# Collect the genre names here.
genres = movies.collect { |m| m['genres'] }.flatten.sort.uniq

# Print the ratings and genre names
genres.each do |genre|
  # get the average rating for all the films of the genre
  ratings = movies.collect { |m| m['rating'] if m['genres'].include? genre }
  ratings.delete nil
  avg_rating = ratings.inject { |sum, rating| sum + rating } / ratings.count
  puts "%0.2f #{genre}" % avg_rating
end
