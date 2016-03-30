require "tty"

module OutputStrategy
  module ConsoleOut
    def self.generate(snapshots, size)
      snapshots.each do |pg|
        console_out_array = Support::Convertors::Console.convert(Marshal.load(pg).cells, size)
        table = TTY::Table[*console_out_array]
        puts `clear`
        puts table.to_s
        sleep 0.5
      end
      puts `clear`
    end
  end
end
