require "tty"

module Support
  module ConsoleWrite
    def self.show(array, size)
      array.each do |pg|
        array = MatrixRepresentation.new(Marshal.load(pg).cells, size).prepare
        table = TTY::Table[*array]
        puts %x("clear")
        puts table.to_s
        sleep 0.5
      end
      puts %x("clear")
    end
  end
end
