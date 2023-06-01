require 'json'

module JsonStorage
  def get_data(file_path)
    if File.exist?(file_path)
      file = File.read(file_path)
      JSON.parse(file)
    else
      []
    end
  end

  def update_data(data, file_path)
    File.open(file_path, 'w') do |file|
      file.write(JSON.pretty_generate(data))
    end
  end
end
