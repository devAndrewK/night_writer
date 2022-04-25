require './lib/file_reader'
file_reader = FileReader.new
#file_reader.read
file_reader.write_braille
file_reader.print_output_message

require 'pry';binding.pry
