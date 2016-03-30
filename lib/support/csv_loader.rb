require "csv"

module Support
  class CsvLoader
    attr_reader :file_path, :size

    def initialize(file_path)
      @file_path = file_path
    end

    def load
      data = CSV.read(file_path, converters: :numeric)
      @size = data.pop.first
      data
    end
  end
end
