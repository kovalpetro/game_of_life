require "csv"

class CsvLoader
  attr_reader :file_path, :size

  def initialize(file_path)
    @file_path = file_path
  end

  def load
    [].tap do |out|
      CSV.foreach(file_path) { |row| out << row.map(&:to_i) }
      @size = out.pop.first
      out
    end
  end
end
