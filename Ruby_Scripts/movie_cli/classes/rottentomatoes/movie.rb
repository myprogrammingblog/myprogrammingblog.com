require_relative '../../helpers/rottentomatoes/movie_output_helper'

module RottenTomatoes

	# Class holds parsed RottenTomatoes movie information
	#
	# @author Anatoly Spektor
	#
	# @attr [Integer] id RottenTomatoes movie id
	# @attr [Integer] year Year movie was released
	# @attr [String] title Movie Full Title
	# @attr [HashMap] release_dates Information when movie was released in theatres and on DVD
	# @attr [HashMap] ratings Information about Critics and Audience rating
	# @attr [Array] gernes Gerne information
	# @attr [String] synopsis Short Description of the movie
	# @attr [HashMap] posters  Links to movie posters
	# @attr [Array] cast List of actors their Rottentomatoes ID and their characters name
	class Movie
		include RottenTomatoes::MovieOutputHelper

		attr_accessor :id, :year, :gernes, :title, :release_dates, :ratings, :synopsis, :posters, :cast

		def initialize(_id, _year, _gernes, _title, _release_dates, _ratings, _synopsis, _posters, _abridged_cast)
			@id = _id
			@year = _year
			@gernes = _gernes
			@title = _title
			@release_dates = _release_dates
			@ratings = _ratings
			@synopsis = _synopsis
			@posters = _posters
			@cast = _abridged_cast
		end
	end
end