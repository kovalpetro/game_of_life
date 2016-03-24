require "csv"

class CsvLoader
  attr_reader :file_path, :size

  def initialize(file_path)
    @file_path = file_path
  end

  def load
    line_count = %x(wc -l #{file_path}).to_i

    [].tap do |out|
      CSV.foreach(file_path) do |row|
        out << row.map(&:to_i) unless $. == line_count
        @size = row.first.to_i if $. == line_count
      end

      out
    end
  end
end
