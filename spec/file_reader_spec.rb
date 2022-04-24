require './lib/file_reader'

RSpec.describe FileReader do

  it 'exists' do
    file_reader = FileReader.new
    expect(file_reader).to be_a(FileReader)
  end

  it 'has attributes' do

    ARGV.replace (["rspec.txt"])
    file_reader = FileReader.new
    expect(file_reader.input_filepath).to eq("rspec.txt")
  end

  it 'can read from a file' do
    file_reader = FileReader.new
    expect(file_reader.read).to eq("test")

  end


end
