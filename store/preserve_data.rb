class PreserveData
  def save_data(data, filename)
    data = JSON.pretty_generate(data)
    File.write(filename, data)
  end

  def load_data(filename)
    JSON.parse(File.read(filename))
  end
end
