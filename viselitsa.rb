#(c) goodprogrammer.ru

current_path = File.dirname(__FILE__ )

require current_path + "/game.rb"
require current_path + "/result_printer.rb"
require current_path + "/word_reader.rb"

puts "Игра виселица, v3"

printer = ResultPrinter.new

reader = WordReader.new

# Считывает слово из командной строки
# при вызове vilelitsa.rb
slovo = reader.read_from_file(current_path + "/data/words.txt")

game = Game.new(slovo)
while  game.status == 0 do

  # Вывод статуса игры
  printer.print_status(game)

  # Просим у пользователя новую букву
  game.ask_next_letter
end

printer.print_status(game)