require 'json'

module JsonStorage
  def update_data(array, file_path)
    opts = {
      array_nl: "\n",
      object_nl: "\n",
      indent: '  ',
      space_before: ' ',
      space: ' '
    }
    json = JSON.generate(array, opts)
    File.write(file_path, json)
  end

  def get_data(file_path)
    return [] unless File.exist?(file_path)

    file = File.read(file_path)
    JSON.parse(file)
  end
end
