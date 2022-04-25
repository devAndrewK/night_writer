require './lib/dictionary'
class FileReader
  include Dictionary
  attr_accessor :input_filepath, :output_filepath, :message, :braille

  def initialize
    @input_filepath = ARGV[0]
    @output_filepath = ARGV[1]
    @message = File.read(@input_filepath).delete("\n")
    @braille = ""
  end

  def read(incoming_file)
    File.read(incoming_file).delete("\n")
  end

  def convert_to_braille
    top = []
    mid = []
    bottom = []
    output_message = []
    @message.each_char do |letter|
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
    @braille = output_message.join
  end

  def write_braille
    english = File.open(@output_filepath,"w")
    english.write(@braille)
    english.close
  end

  def file_length
    @message.length
  end

  def print_output_message
    p "Created #{@output_filepath} containing #{file_length} characters"
  end

end
