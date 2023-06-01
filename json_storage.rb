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
    existing_data = get_data(file_path) # Load existing data from the file
    updated_data = existing_data + data # Concatenate existing data with new data

    File.write(file_path, JSON.pretty_generate(updated_data))
  end
end
