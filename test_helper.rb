module TestHelper
  def read_file(file_name)
    File.read(file_name).split.map(&:to_i)
  end
end
