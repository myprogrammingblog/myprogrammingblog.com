require 'rest-client'
require 'uri'
require_relative 'movie'
require 'yaml'

# Module holding RottenTomatoes API related logic and objects
module RottenTomatoes

	# Class Reponsible for communication with RottenTomatoes and parsing its information
	#
	# @author Anatoly Spektor
	#
	# @attr_writer [HashMap] config Configuration file holding RottenTomatoes API paths and Key
	# @attr [String] api_url String that holds api_url that is called to get movie information
	class ApiConnector

		attr_accessor :api_url
		attr_writer :config

		def initialize
			# path can be either from root or for debugging from the curent class
			if File.exists?('../../config/api_paths.yml')
				@config = YAML.load(File.open('../../config/api_paths.yml'))
			elsif File.exists?('./config/api_paths.yml')
				@config = YAML.load(File.open('./config/api_paths.yml'))
			else
				raise StandardError, 'Configuration File cannot be found... please make sure you have api_paths.yml'
			end
		end

		# Constructs base url used for API calls from api_paths configuraiton file
		#
		# @return [String] base url
		def base_url
			if @config.has_key?('rottentomatoes')
				@config['rottentomatoes']['protocol'] + @config['rottentomatoes']['host'] + @config['rottentomatoes']['api_path']
			else
				raise StandardError, 'api_paths.yml must have rottentomatoes information such as host, protocol and api_path'
			end
		end

		# Receives String, makes call to RottenTomatoes and returns JSON object with movies information from RottenTomatoes
		#
		# @param [String] title movie title to get more info about
		#
		# @return [HashMap] JSON with movie information
		def get_movie_by_title(title)
			full_path = base_url + "movies.json"
			# using RestClient make call to restful API with api_ley title and max_movies_per_output
			RestClient.get(full_path, {:params =>
																		 {
																				 :apikey => @config['rottentomatoes']['api_key'],
																				 :q => title,
																				 :page_limit => @config['rottentomatoes']['max_movies_per_output']
																		 }
																 # act on response result
															}) { |response, request, result, &block|
				case response.code
					# if succes connection start acting on result
					when 200
						json_result = JSON.parse(response.body)
						if json_result.has_key?('movies')
							put_json_into_movie_obj(json_result['movies'])
						end
					# if not succesfull just raise an exception
					else
						raise StandardError, "Cannot connect to RottenTomatoes API, please check config/api_paths.yml for valid api_key"
				end
			}
		end


		private

		# Puts JSON object into a RottenTomatoes::Movie object
		# @param [HashMap] movie_json JSON object with movie information
		#
		# @return [Array] array of RottenTomatoes::Movie objects
		def put_json_into_movie_obj(movie_json)
			movie_json.map { |movie| RottenTomatoes::Movie.new(movie['id'], movie['year'], movie['gernes'],
																												 movie['title'], movie['release_dates'], movie['ratings'],
																												 movie['synopsis'], movie['posters'], movie['abridged_cast']) }
		end

	end

end
