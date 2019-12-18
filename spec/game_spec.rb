require 'rspec'

require './game.rb'

describe 'Game' do

  # Победа без ошибок
  it 'should win' do
    # Загадываем слово
    game = Game.new('слово')

    # Убедимся, что статус игры - игра в процессе
     expect(game.status).to eq 0

    # Внесем правильные буквы для проверки при 100% правильном ответе
    game.next_step 'о'
    game.next_step 'л'
    game.next_step 'в'
    game.next_step 'с'

    # Ошибок 0?
    expect(game.errors).to eq 0
    # Победил ли игрок ?
    expect(game.status).to eq 1
  end

  # Проигрыш без единого попадания
  it 'should loses' do
    game = Game.new('слово')

    # Ввод без единого попадания в слово
    game.next_step 'й'
    game.next_step 'ц'
    game.next_step 'у'
    game.next_step 'к'
    game.next_step 'е'
    game.next_step 'н'
    game.next_step 'г'

    # Ошибок 7?
    expect(game.errors) .to eq 7
    # Игрок проиграл ?
    expect(game.status) .to eq -1
  end

end
