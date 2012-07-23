#!/usr/bin/env ruby

require 'json'

class MovieRating
    def initialize datafile
      raw_data = IO.read(datafile)
      @movies  = JSON.parse(raw_data)
    rescue Exception => e
      puts "Caught exception #{e.message} while parsing the json input"
    end

    def calculate_rating
      @genres = {}
      @movies["movies"].each do |mov|
        mov["genres"].each do |gen|
            if @genres[gen].nil?
                @genres[gen] = { :rating => mov["rating"].to_f, :count => 1}
            else
                @genres[gen][:rating] += mov["rating"].to_f
                @genres[gen][:count] += 1
            end
        end
      end
    end

    def results
        @genres.each do |name, values|
            puts "#{(values[:rating]/values[:count]).round(2)} for #{name}"
        end
    end
end

mr = MovieRating.new 'data/movies.json'
mr.calculate_rating
mr.results
