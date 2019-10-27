class Game

  # Конструктор
  def initialize(slovo)

    # слово разбитое на массив буквы
    @letters = get_letters(slovo)

    # Количество ошибок
    @errors = 0

    # Массив угаданных букв
    @good_letters = []
    # Массив не угаданных букв
    @bad_letters = []

    @status = 0
  end

  # Разбивает слово на массив букв
  def get_letters(slovo)

    # Проверка на ошибочный ввод
    if slovo == nil || slovo == ""
      abort 'Для игры введите загаданное слово в качестве аргумента при ' \
        'запуске программы'
    end

    #split - при передачи пустой строки возвращает
    # слово разбитое на массив букв
    return slovo.encode('UTF-8').split('')
  end

  # Проверка наличия буквы в загаданном слове
  # Или среди уже названных букв (@good_letter, @bad_letter)
  def next_step(bukva)

    # Проверка на победу или проигрыш
    if @status == -1 || @status == 1

      # Пустой return завершит выполнение метода
      return
    end

    # Проверка ошибочного или повторного ввода буквы
    # .include - проверяет наличие такой же буквы в массиве
    if @good_letters.include?(bukva) ||
        @bad_letters.include?(bukva)
      return
    end

    if  (bukva == 'е' && @letters.include?('ё')) ||
        (bukva == 'ё' && @letters.include?('е')) ||
        (bukva == 'и' && @letters.include?('й')) ||
        (bukva == 'й' && @letters.include?('и'))
      # В любом (поэтому эти условия объединяет оператор ||) из этих случаев мы
      # добавляем в массив хороших букв ту, что была введена пользователем и
      # её подружку, если есть (считаем «подружками» е + ё» и и + й).
      if bukva == 'е'
        @good_letters << 'ё'
      end

      if bukva == 'ё'
        @good_letters << 'е'
      end

      if bukva == 'и'
        @good_letters << 'й'
      end

      if bukva == 'й'
        @good_letters << 'и'
      end
    end

    #Введена правильная буква
    if @letters.include?(bukva)
      @good_letters << bukva
      # Отгадано все слово
      #.uniq - оставляет только уникальные элементы
      # (убирает дублирующиеся)
      # .size - количество элементов в массиве
      if @letters.uniq.size == @good_letters.size
        @status = 1
      end
      # Условие, когда введена не правильная буква
    else
      @bad_letters << bukva
      @errors += 1
      if @errors >= 7
        @status = -1
      end
    end
  end

  # Ввод следующей буквы
  def ask_next_letter
    puts "\nВведите следующую букву"

    letter = ''
    while letter == ''
      letter = STDIN.gets.encode('UTF-8').chomp
    end

    # После получения ввода, передаем управление в основной метод игры
    next_step(letter)
  end
  # Методы, которые позволят получить внутренние данные (начинающиеся с @)
  # для данного класса другим классам

  def letters
    #опускаем слово return, но из-за того, что
    # последняя строчка - переменная, ruby все равно
    # вернет нашу переменную (return необязательно, он все равно сработает)
    @letters
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

  def status
    @status
  end

  def  errors
    @errors
  end

end
