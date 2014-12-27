# This class represents some of the array functionality such as:
#
# * find dups of an array
# * find uniq elements of an array
# * get number of occurencies of element
#
# Author: Anatoly Spektor
class Array::Manipulator

	# This function determines uniq elements in array
	#
	# @param [Array] arr  initial array
	# @return [Array] uniq elements array
		def self.uniq(arr)
			# don't bother if is not an array of it is empty
			return 0 unless arr.kind_of?(Array) && arr.length > 0
			uniq_arr = []
			find_occurences(arr).each do |key, value|
				if value == 1
					uniq_arr << key
				end
			end
			uniq_arr
		end

	# This function determines dups in array
	#
	# @param [Array] arr  initial array
	# @return [Array] uniq elements array
		def self.dup(arr)
			# don't bother if is not an array of it is empty
			return 0 unless arr.kind_of?(Array) && arr.length > 0
			dup_arr = []
			find_occurences(arr).each do |key, value|
				if value > 1
					dup_arr << key
				end
			end
			dup_arr
		end

	# This function determines dups in array
	#
	# @param [Array] arr  initial array
	# @param [String,Integer] search_term search term
	# @return [Array] uniq elements array
		def self.number_of_occurencies(arr,search_term)
			# don't bother if is not an array of it is empty or no search_term
			return 0 unless arr.kind_of?(Array) && arr.length > 0 && search_term

			num_occurencies = find_occurences(arr)[search_term]
			num_occurencies ? num_occurencies : 0
		end

	private

	# This function determines dups in array and returns the map
	# with number of occurencies.
	# From this map user can get either uniq values or duplicates
	#
	# @param [Array] arr  initial array
	# @return [HashMap] occurencies map
		def self.find_occurences(arr)
			return nil unless arr.kind_of?(Array)

			occurrences_map = {}
			arr.each do |element|
				# if it already exist increment number of occurrences
				if occurrences_map[element]
					#if it does not set it
					occurrences_map[element] = occurrences_map[element] + 1
				else
					occurrences_map[element] = 1
				end
			end
			occurrences_map
		end
end



