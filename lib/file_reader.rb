class FileReader
  attr_accessor :input_filepath, :output_filepath

  def initialize
    @input_filepath = ARGV[0]
    @output_filepath = ARGV[1]
  end

  def read
    File.read(@input_filepath).delete("\n")
  end

  def print_output_message
    puts "Created 'braille.txt' containing 256 characters"

  end

end
