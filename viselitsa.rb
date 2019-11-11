#(c) goodprogrammer.ru

# Проверяем на какой ОС работаем, если windows - задаем кодировки
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем библиотеку unicode_utils. Предварительно её надо установить, набрав
# в консоли:
# gem install unicode_utils
require "unicode_utils"
require_relative 'game.rb'
require_relative 'result_printer.rb'
require_relative 'word_reader.rb'

current_path = File.dirname(__FILE__ )

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