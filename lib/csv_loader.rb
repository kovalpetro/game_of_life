require "csv"
require "byebug"

class CsvLoader
  def self.load(file_path)
    [].tap do |out|
      CSV.foreach(file_path) do |row|
        out << row.map(&:to_i)
      end
      out
    end
  end
end
