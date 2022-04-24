class FileReader
  attr_accessor :input_filepath, :output_filepath

  def initialize
    @input_filepath = ARGV[0]
    @output_filepath = ARGV[1]
  end

  def read
    File.read(@input_filepath).delete("\n")
  end

  def write_braille

  end

  def file_length
    read.length
  end

  def print_output_message
    p "Created #{@output_filepath} containing #{file_length} characters"
  end

end
