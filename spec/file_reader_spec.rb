require './lib/file_reader'

RSpec.describe FileReader do

  it 'exists' do
    file_reader = FileReader.new
    expect(file_reader).to be_a(FileReader)
  end

  it 'has attributes' do
    ARGV.replace (["rspec.txt", "rspec_output.txt"])
    file_reader = FileReader.new
    expect(file_reader.input_filepath).to eq("rspec.txt")
    expect(file_reader.output_filepath).to eq("rspec_output.txt")
  end

  it 'can read from a file' do
    file_reader = FileReader.new
    expect(file_reader.read(file_reader.input_filepath)).to eq("test")
  end

  it 'can print_output_message' do
    file_reader = FileReader.new
    #require 'pry';binding.pry
    expect(file_reader.print_output_message).to eq(
      "Created rspec_output.txt containing 4 characters")
  end

  it 'can write to a file' do
    file_reader = FileReader.new
    file_reader.write_braille
    expect(file_reader.read(file_reader.output_filepath)).to eq("test")
  end


end
