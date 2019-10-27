class ResultPrinter

  # 1. выводить загаданное слово (по мере отгаданных букв)
  # 2. информацию об ошибках и уже названные буквы
  # 3. ошибок >7 - сообщить о поражении
  # 4. слово угадано - сообщить о победе
  def print_status(game)
    cls
    # 1
    puts "\nСлово: " + get_word_for_print(game.letters,game.good_letters)

    print_viselitsa(game.errors)
    # 2
    # .join - выводит массив в строку, разделяя эллементы массива
    # параметром в скобках (", ")
    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"

    # 3
    if game.errors >= 7
      puts "Вы проиграли :("
    else
      # 4
      # Проверка уникальных букв в слове с массивом введнных пользователем букв
      if game.letters.uniq.size == game.good_letters.size
        puts "Поздравляем! Вы выиграли!\n\n"
        # Вывод доступного количества попыток
      else
        puts "У вас осталось попыток: " + (7 - game.errors).to_s
      end
    end
  end

  # Вывод не полностью отгаданного слово
  def get_word_for_print(letters, good_leters)
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

  def cls
    system "clear"
  end

  def print_viselitsa (errors)
    case errors
    when 0
      puts '
          _______
          |/
          |
          |
          |
          |
          |
          |
          |
        __|________
        |         |
        '
    when 1
      puts '
        _______
        |/
        |     ( )
        |
        |
        |
        |
        |
        |
      __|________
      |         |
      '
    when 2
      puts '
        _______
        |/
        |     ( )
        |      |
        |
        |
        |
        |
        |
      __|________
      |         |
      '
    when 3
      puts '
        _______
        |/
        |     ( )
        |      |_
        |        \\
        |
        |
        |
        |
      __|________
      |         |
      '
    when 4
      puts '
        _______
        |/
        |     ( )
        |     _|_
        |    /   \\
        |
        |
        |
        |
      __|________
      |         |
      '
    when 5
      puts '
        _______
        |/
        |     ( )
        |     _|_
        |    / | \\
        |      |
        |
        |
        |
      __|________
      |         |
      '

    when 6
      puts '
        _______
        |/
        |     ( )
        |     _|_
        |    / | \\
        |      |
        |     / \\
        |    /   \\
        |
      __|________
      |         |
      '
    when 7
      puts '
        _______
        |/     |
        |     (_)
        |     _|_
        |    / | \\
        |      |
        |     / \\
        |    /   \\
        |
      __|________
      |         |
      '
    end
  end

end
