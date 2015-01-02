# This class allows user to generate uniq filename based on:
#
# * users desired file name
# * file array that is passed
#
# Example:
#        if you pass a.jpg and an array consist of ['a.jpg', 'a-1.jpg', 'a-3.png']
#        the new file name will be named a-2.jpg. It looks both at an extension and on max number after '-',
#        so that new filename's number is always higher then the highest in the array.
#
# Uses:
#       This helps to resolve dilemma when files cannot be created/copied/cloned because the file name already exist.
#
# Author:   Anatoly Spektor
# Version:  0.5
#
class File::Name

  attr_writer :file_list

  # Function generates uniq file name if new_file_name does exist in the file list
  # otherwise it just returns new_file_name
  #
  # @param [Array] files files array
  # @param [String] new_file_name desired file_name
  #
  # @return [String] either generated new_file_name or passed new_file_name if it already uniq
  def self.get_uniq(files, new_file_name)

    raise TypeError, 'File list must be an array' unless files.kind_of?(Array)
    raise ArgumentError, 'File name is in the wrong format' unless /^[\w,\s-]+\.[A-Za-z]{3}/ =~ new_file_name

    @file_list = files
    if @file_list.include?(new_file_name)
      generate_random_filename(new_file_name)
    else
      new_file_name
    end
  end

  private

  # Function generates uniq file name from the String passed to it
  # based on extension and basename
  #
  # @param [String] new_file_name desired file_name
  #
  # @return [String] either generated new_file_name or passed new_file_name if it already uniq
  def self.generate_random_filename(filename)
    ext = File.extname(filename)
    name = File.basename(filename, ext)
    numbers_of_related_files = []
    @file_list.select  do |file|
      if File.basename(file).include?(name) && File.extname(file) == ext
        numbers_of_related_files << file.split("-").last.to_i
      end
    end
    return name +  '-' + (numbers_of_related_files.max + 1).to_s + ext
  end

end