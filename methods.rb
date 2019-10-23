# Введенное слово
def get_letters
  slovo = ARGV[0]

  if slovo == nil || slovo == ""
    abort "Вы не ввели слово для игры"
  end
  #split - при передачи пустой строки возвращает
  # слово разбитое на массив букв
  return slovo.split("")
end

# Ввод буквы игроком
def get_user_input
  letter = ""

  #Проверка на корректный ввод
  while  letter ==""do
    letter = STDIN.gets.chomp
  end

  return letter
end

# Проверка введенной буквы
def check_result(user_input,letters,good_leters,bad_letters)

  # Проверка ошибочного или повторного ввода буквы
  # .include - проверяет наличие такой же буквы в массиве
  if (good_leters.include?(user_input) ||
      bad_letters.include?(user_input))
    return 0
  end

  if  (user_input == 'е' && letters.include?('ё')) ||
      (user_input == 'ё' && letters.include?('е')) ||
      (user_input == 'и' && letters.include?('й')) ||
      (user_input == 'й' && letters.include?('и'))
    # В любом (поэтому эти условия объединяет оператор ||) из этих случаев мы
    # добавляем в массив хороших букв ту, что была введена пользователем и
    # её подружку, если есть (считаем «подружками» е + ё» и и + й).
    if user_input == 'е'
      good_leters << 'ё'
    end

    if user_input == 'ё'
      good_leters << 'е'
    end

    if user_input == 'и'
      good_leters << 'й'
    end

    if user_input == 'й'
      good_leters << 'и'
    end
  end

  #Введена правильная буква
  if letters.include? user_input
    good_leters << user_input
    # Условие, когда отгадано все слово
    #.uniq - оставляет только уникальные элементы
    # (убирает дублирующиеся)
    # .size - количество элементов в массиве
    if letters.uniq.size == good_leters.size
      return 1
    else
      # Условие, когда введена правильная буква
      return  0
    end
    # Условие, когда введена не правильная буква
  else
    bad_letters << user_input
    return -1
  end
end

# Вывод не полностью отгаданного слово
def get_word_for_print(letters,good_leters)
  result = ''
  # Проверка наличия отгаданных букв в слове
  for letter in letters do
    # Если буква отгадана добавляем ее в result для вывода
    if good_leters.include? letter
      result += letter + " "
      # Иначе ставим прочерк
    else
      result += '__ '
    end
  end

  return  result
end

# 1. выводить загаданное слово (по мере отгаданных букв)
# 2. информацию об ошибках и уже названные буквы
# 3. ошибок >7 - сообщить о поражении
# 4. слово угадано - сообщить о победе
def print_status(letters,good_leters,bad_letters,errors)
  # 1
  puts "\nСлово: " + get_word_for_print(letters,good_leters)

  # 2
  # .join - выводит массив в строку, разделяя эллементы массива
  # параметром в скобках (", ")
  puts "Ошибки (#{errors}): #{bad_letters.join(", ")}"

  # 3
  if errors >= 7
    puts "Вы проиграли :("
  else
    # 4
    # Проверка уникальных букв в слове с массивом введнных пользователем букв
    if letters.uniq.size == good_leters.size
      puts "Поздравляем! Вы выиграли!\n\n"
      # Вывод доступного количества попыток
    else
      puts "У вас осталось попыток: " + (7 - errors).to_s
    end
  end
end

# Очистка экрана
def cls
  system "clear"
end