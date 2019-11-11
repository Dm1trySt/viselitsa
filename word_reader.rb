class WordReader
  def read_from_file(file_name)

    # Проверка, существует ли файл ?
   begin
     f = File.new(file_name, 'r:UTF-8')

     # массив из строк (из файла.txt) присваиваем в переменную lines
     lines = f.readlines
     f.close
   rescue SystemCallError
     abort "Файл со словами не найден!"
   end

    # Возвращаем случайное слово
    return  lines.sample.chomp

  end
end