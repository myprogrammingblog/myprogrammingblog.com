require 'benchmark'

def reverse_whole_string(string)
	raise StandardError.new('Passed string cannot be reversed because it is empty') if string.nil? || string.empty?
	end_loop = string.length
	new_string = ''
	while end_loop >= 0
		end_loop -= 1 # arrays start with 0, so we need to do end_loop -1 first
		new_string += string[end_loop]
	end
	new_string
end

def reverse_each_word_in_a_string(string)
	raise StandardError.new('Passed string cannot be reversed because it is empty') if string.nil? || string.empty?
	words = string.split(" ") #splitting string into an Array of words
	new_sentence = []
	words.each do |word|
		# doing the same thing as reverse_whole_string
		# but with eah word from an array
		end_loop = word.length
		new_string = ''
		while end_loop > 0
			end_loop -= 1
			new_string += word[end_loop] #Reversing every letter of each word
		end
		new_sentence << new_string # appending every word to an new Array
		# or you could just do this: new_sentence << reverse_whole_string(word)
	end
	new_sentence.join(' ') #joining Array into a string delimited by spaces
end

def reverse_word_order_in_a_sentence(string)
	raise StandardError.new('Passed string cannot be reversed because it is empty') if string.nil? || string.empty?
	words = string.split(" ")
	new_sentence = []
	end_loop = words.length
	while end_loop > 0
		end_loop -= 1
		new_sentence << words[end_loop]
	end
	new_sentence.join(' ')
end


def comparison_systen_and_custom_reverse

	puts "\n Custom methods --->\n\n"
	puts "Initial String: Welcome to myprogrammingblog"
	puts "Reverse whole string: #{reverse_whole_string('Welcome to myprogrammingblog')}"
	puts "Reverse each word in a string: #{reverse_each_word_in_a_string('Welcome to myprogrammingblog')}"
	puts "Reverse word order in a sentence:  #{reverse_word_order_in_a_sentence('Welcome to myprogrammingblog')}"


	puts "\n Ruby methods --->\n\n"
	puts "Initial String: Welcome to myprogrammingblog"
	puts "Reverse whole string: #{'Welcome to myprogrammingblog'.reverse}"
	puts "Reverse each word in a string #{'Welcome to myprogrammingblog'.split(" ").each {|word| word.reverse!}.join(" ")}"
	puts "Reverse word order in a sentence: #{'Welcome to myprogrammingblog'.split.reverse.join(" ")}"

end

def time_required_comparison
	Benchmark.bm do |bm|
		bm.report('c-rev-string') do
			reverse_whole_string('Welcome to myprogrammingblog')
		end
		bm.report('s-rev-string') do
			'Welcome to myprogrammingblog'.reverse
		end

		bm.report('c-rev-words') do
			reverse_each_word_in_a_string('Welcome to myprogrammingblog')
		end
		bm.report('s-rev-words') do
			'Welcome to myprogrammingblog'.split(" ").each {|word| word.reverse!}.join(" ")
		end

		bm.report('c-rev-word-order') do
			reverse_word_order_in_a_sentence('Welcome to myprogrammingblog')
		end
		bm.report('s-rev-word-rder') do
			'Welcome to myprogrammingblog'.split.reverse.join(" ")
		end

	end
end

puts "\n\n Sample Output\n\n"
comparison_systen_and_custom_reverse
puts "\n Time Required to perform those operations --->\n\n"
time_required_comparison