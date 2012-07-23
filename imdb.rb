require 'json'

movies = JSON.parse IO.read 'data/movies.json'
ratings={}
movies["movies"].each do |movie|
	movie['genres'].each do |genre|
		unless ratings[genre.to_sym].nil?
			ratings[genre.to_sym]['net_rating']+=movie["rating"].to_f
			ratings[genre.to_sym]['count']+=1
		else
			ratings[genre.to_sym]={}
			ratings[genre.to_sym]['net_rating']=movie["rating"].to_f
			ratings[genre.to_sym]['count']=1
		end	
	end
end
ratings.each {|genre,rating| ratings[genre] = rating['net_rating']/rating['count']}
Hash[ratings.sort.each {|genre,rating| puts "%0.2f #{genre.to_s}" % rating}] #nasty, but still simple
			


