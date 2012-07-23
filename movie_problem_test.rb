require './movie_problem'
require 'test/unit'

class TestMovieProblem < Test::Unit::TestCase
    DATA_FILE = "data/movies.json"
    def test_load_input
        mp = MovieRating.new(DATA_FILE)
        assert_not_nil(mp,"Parsing Failed")
    end

    def test_load_input_no_input
        mp = MovieRating.new("")
        assert_not_nil(mp,"Parsing Failed")
    end

    def test_calculate_rating
        mp = MovieRating.new(DATA_FILE)
        assert_nothing_raised(Exception) do
          mp.calculate_rating
        end
    end

    def test_results
        mp = MovieRating.new(DATA_FILE)
        assert_nothing_raised(Exception) do
          mp.calculate_rating
          mp.results
        end
    end
end
