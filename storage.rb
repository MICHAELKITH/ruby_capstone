module Storage
  def save_data(data, file_path)
    File.open(file_path, 'w') do |file|
      Marshal.dump(data, file)
    end
  end

  def load_data(file_path)
    if File.exist?(file_path)
      File.open(file_path, 'r') do |file|
        Marshal.load(file)
      end
    else
      []
    end
  end
end
