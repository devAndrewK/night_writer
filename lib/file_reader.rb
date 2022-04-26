require './lib/dictionary'
class FileReader
  include Dictionary
  attr_accessor :input_filepath, :output_filepath, :input, :output

  def initialize
    @input_filepath = ARGV[0]
    @output_filepath = ARGV[1]
    @input = File.read(@input_filepath).delete("\n")
    @output = ""
  end

  def english_to_braille_routine
    convert_to_braille
    write_to_file
    print_output_message(@input)
  end

  def braille_to_english_routine
    convert_to_english
    write_to_file
    print_output_message(@input)
  end

#max length of braille in a line is 240
  def convert_to_english
    top = []
    mid = []
    bottom = []
    index = 0
    file = File.open(@input_filepath, "r")
    file.each do |line|
      line.delete("\n")
      index += 1
      top << line if index == 1
      mid << line if index == 2
      bottom << line && index = 0 if index == 3
    end

    top.each_with_index do |braille, index|
      top[index] = top[index].chars.each_slice(2).map(&:join)
      mid[index] = mid[index].chars.each_slice(2).map(&:join)
      bottom[index] = bottom[index].chars.each_slice(2).map(&:join)
    end

    temp_output = []
    top.each_with_index do |braille, outer_index|
      top[outer_index].each_with_index do |segment, index|
        braille_to_convert = []
        braille_to_convert << top[outer_index][index]
        braille_to_convert << mid[outer_index][index]
        braille_to_convert << bottom[outer_index][index]
        temp_output << braille_dictionary.select do |letter, braille|
          braille == braille_to_convert
        end.keys[0]
      end.join
    end
    braille_output = []
    temp_output.each_slice(80).map(&:join).map do |line|
      braille_output << line
      braille_output << "\n"
    end
    braille_output.delete("\n") if braille_output.length < 80
    @output = braille_output.join
  end

  def write_to_file
    text = File.open(@output_filepath,"w")
    text.write(@output)
    text.close
  end

  def convert_to_braille
    top = []
    mid = []
    bottom = []
    output_message = []
    @input.each_char do |letter|
      if top.length == 40
        top << "\n"
        mid << "\n"
        bottom << "\n"
        top.join
        mid.join
        bottom.join
        output_message << top
        output_message << mid
        output_message << bottom
        top = []
        mid = []
        bottom = []
      end
      top << braille_dictionary[letter][0]
      mid << braille_dictionary[letter][1]
      bottom << braille_dictionary[letter][2]
    end
    top << "\n"
    mid << "\n"
    bottom << "\n"
    output_message << top.join
    output_message << mid.join
    output_message << bottom.join
    @output = output_message.join
  end

  def file_length(input_file)
    input_file.size
  end

  def print_output_message(input_file)
    p "Created #{@output_filepath} containing #{file_length(input_file)} characters"
  end

end
