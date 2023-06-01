require 'json'

module Storage
  def save_data(data, file_path)
    File.write(file_path, JSON.generate(data))
  end

  def load_data(file_path)
    if File.exist?(file_path)
      File.open(file_path, 'r') do |file|
        JSON.parse(file.read)
      end
    else
      []
    end
  end
end
