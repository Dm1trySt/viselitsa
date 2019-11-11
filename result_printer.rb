class ResultPrinter

  def initialize
    @status_image = []

    # Счетчик
    counter = 0

    current_path = File.dirname(__FILE__ )

    # Запись изображений виселицы
    while counter <= 7 do
      file_name = current_path + "/image/#{counter}.txt"

      begin
        f = File.new(file_name, 'r:UTF-8')

        # .read - запись всех элементов из файла
        @status_image << f.read
        f.close
      rescue SystemCallError
        # Если случилась такая ошибка мы продолжаем работать дальше, т.к. без
        # изображения виселицы вполне можно играть.
        @status_image << "\n[ Изображение не найдено ]\n"
      end
      counter += 1
    end
  end

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
    system('clear') || system('cls')
  end

  def print_viselitsa (errors)
    puts @status_image[errors]
  end

end
