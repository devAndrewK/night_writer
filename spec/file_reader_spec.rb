require './lib/file_reader'
require './lib/dictionary'

RSpec.describe FileReader do
  include Dictionary

  it 'exists' do
    ARGV.replace (["rspec.txt", "rspec_output.txt"])
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
    ARGV.replace (["rspec.txt", "rspec_output.txt"])
    file_reader = FileReader.new
    expect(file_reader.input).to eq("test")
  end

  it 'can print_output_message' do
    ARGV.replace (["rspec.txt", "rspec_output.txt"])
    file_reader = FileReader.new
    expect(file_reader.print_output_message(file_reader.input)).to eq(
      "Created rspec_output.txt containing 4 characters")
  end

  it 'can write to a file' do
    ARGV.replace (["rspec.txt", "rspec_output.txt"])
    file_reader = FileReader.new
    file_reader.output = "test"
    file_reader.write_to_file
    expect(File.read(file_reader.output_filepath)).to eq("test")
  end

  it 'can convert english to braille' do
    ARGV.replace (["rspec.txt", "rspec_output.txt"])
    file_reader = FileReader.new
    expect(file_reader.convert_to_braille).to eq(
      ".oo..o.o\noo.oo.oo\no...o.o.\n")
  end

  it 'can convert braille to english' do
    ARGV.replace (["rspec_braille.txt", "rspec_braille_output.txt"])
    file_reader = FileReader.new
    expect(file_reader.convert_to_english).to eq(
      "test")
  end

  it 'can run english_to_braille_routine' do
    ARGV.replace (["rspec.txt", "rspec_output.txt"])
    file_reader = FileReader.new
    file_reader.english_to_braille_routine
    expect(file_reader.output).to eq(".oo..o.o\noo.oo.oo\no...o.o.\n")
  end

  it 'can run braille_to_english_routine' do
    ARGV.replace (["rspec_braille.txt", "rspec_braille_output.txt"])
    file_reader = FileReader.new
    file_reader.braille_to_english_routine
    expect(file_reader.output).to eq("test")
  end

  it 'can use dictionary' do
    expected = {
          'a' => ['o.', '..', '..'],
          'b' => ['o.', 'o.', '..'],
          'c' => ['oo', '..', '..'],
          'd' => ['oo', '.o', '..'],
          'e' => ['o.', '.o', '..'],
          'f' => ['oo', 'o.', '..'],
          'g' => ['oo', 'oo', '..'],
          'h' => ['o.', 'oo', '..'],
          'i' => ['.o', 'o.', '..'],
          'j' => ['.o', 'oo', '..'],
          'k' => ['o.', '..', 'o.'],
          'l' => ['o.', 'o.', 'o.'],
          'm' => ['oo', '..', 'o.'],
          'n' => ['oo', '.o', 'o.'],
          'o' => ['o.', '.o', 'o.'],
          'p' => ['oo', 'o.', 'o.'],
          'q' => ['oo', 'oo', 'o.'],
          'r' => ['o.', 'oo', 'o.'],
          's' => ['.o', 'o.', 'o.'],
          't' => ['.o', 'oo', 'o.'],
          'u' => ['o.', '..', 'oo'],
          'v' => ['o.', 'o.', 'oo'],
          'w' => ['.o', 'oo', '.o'],
          'x' => ['oo', '..', 'oo'],
          'y' => ['oo', '.o', 'oo'],
          'z' => ['o.', '.o', 'oo'],
          ' ' => ['..', '..', '..']
        }
    expect(braille_dictionary).to eq(expected)
  end




end
