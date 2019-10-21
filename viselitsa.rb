#(c) goodprogrammer.ru

require "./methods.rb"

puts "Игра виселица, v1"

#загаданное слово
letters = get_letters

#счетчик ошибок
errors = 0

#ошибочные буквы введенные пользователем
bad_letters = []
#массив букв, которые есть в слове
good_leters =[]

while errors < 7 do
  print_status(letters,good_leters,bad_letters,errors) #todo

  puts "Введите следующую букву:"

  #ввод буквы
  user_input = get_user_input

  result = check_result(user_input,letters,good_leters,bad_letters) #todo
  #проверка буквы
  if result == -1
    errors += 1
  elsif result == 1
    break
  end
end

#Вывод результатов
print_status(letters,good_leters,bad_letters,errors)
