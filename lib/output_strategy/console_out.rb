require "tty"
require "byebug"

module OutputStrategy
  module ConsoleOut
    def self.generate(snapshots, size)
      snapshots.each do |pg|
        array = Support::Convertors::Console.convert(Marshal.load(pg).cells, size)
        table = TTY::Table[*array]
        puts `clear`
        puts table.to_s
        sleep 0.5
      end
      puts `clear`
    end
  end
end
