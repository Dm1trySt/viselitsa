class WordReader
  def read_from_file(file_name)

    # Проверка, существует ли файл ?
    unless File.exist?(file_name)
      abort "Файл не найден!"
    end

    f = File.new(file_name, 'r:UTF-8')

    # массив из строк (из файла.txt) присваиваем в переменную lines
    lines = f.readlines
    f.close

    # Возвращаем случайное слово
    return  lines.sample.chomp

  end
end