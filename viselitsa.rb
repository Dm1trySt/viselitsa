#(c) goodprogrammer.ru

require "./game.rb"
require "./result_printer.rb"

puts "Игра виселица, v1"

printer = ResultPrinter.new

# Считывает слово из командной строки
# при вызове vilelitsa.rb
slovo = ARGV[0]

game = Game.new(slovo)
while  game.status == 0 do

  # Вывод статуса игры
  printer.print_status(game)

  # Просим у пользователя новую букву
  game.ask_next_letter
end

printer.print_status(game)