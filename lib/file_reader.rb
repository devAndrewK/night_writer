class FileReader
  attr_accessor :input_filepath, :output_filepath, :message#, :braille

  def initialize
    @input_filepath = ARGV[0]
    @output_filepath = ARGV[1]
    @message = File.read(@input_filepath).delete("\n")
    #@input_filepath = "message.txt"
    #@output_filepath = "braille.txt"
    #@braille = File.open(@output_filepath, "w")
  end

  def read(incoming_test)
    File.read(incoming_test).delete("\n")
  end

  def write_braille
    english = File.open(@output_filepath,"w")
    english.write(@message)
    english.close
  end

  def file_length
    @message.length
  end

  def print_output_message
    p "Created #{@output_filepath} containing #{file_length} characters"
  end

end
