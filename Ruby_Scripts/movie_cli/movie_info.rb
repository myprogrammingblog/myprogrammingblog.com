#!/usr/bin/ruby

require_relative './classes/rottentomatoes/api_connector'

# make sure there is just one argument
unless ARGV.length == 1
	puts "Pal, this is not the right number of arguments."
	puts "Usage: ruby movie_info.rb <MOVIE NAME>\n"
	exit
end

# read an argument
movie_name = ARGV[0]

rotten_api = RottenTomatoes::ApiConnector.new
movies = rotten_api.get_movie_by_title(movie_name)

#multiple movies
if movies.kind_of?(Array)

	movies.each do |movie|
		 puts movie.show
	end

end
