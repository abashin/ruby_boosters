puts "Привет! Сейчас ты сыграешь в игру под названием 'Поле чудес'."
puts "Результаты твоей игры присылаются на сайт http://rubyboosters.herokuapp.com/halloffame, где будет составлена таблица лидеров, в зависимости от количества угаданных букв."
puts "Правила просты: ты должен угадать английское слово, перевод которого у тебя уже есть. Ты можешь вводить как буквы, так и разом всё слово, правда слово целиком ты можешь ввести только один раз."
puts "Введи своё имя и фамилию: "
user_name = gets
require "google/cloud/translate"
project_id = "translation-01-220716"
key_file = "My Project-cf8c099f9b91.json"
translate = Google::Cloud::Translate.new project: project_id, keyfile: key_file
arr = File.readlines('noun_dictionary.txt')
text = arr[rand(arr.length)].chomp.downcase
target = "ru"
translation = translate.translate text, to: target
puts "Перевод: #{translation}"
popitki_bukv = text.length
popitki_slova = 1
shifr = ("*" * text.size).chomp
puts shifr
user_point = 0
while (popitki_slova + popitki_bukv != 0) && (shifr["*"] != nil)
  if popitki_slova != 1 && popitki_bukv != [1, 2, 3, 4,]
    puts "Введите букву, у вас осталось #{popitki_bukv} попыток ввести буквы и #{popitki_slova} попыток ввести слово"
  elsif popitki_slova == 1 && popitki_bukv != [1, 2, 3, 4,]
    puts "Введите букву или слово, у вас осталось #{popitki_bukv} попыток ввести буквы и #{popitki_slova} попытка ввести слово"
  elsif  popitki_slova != 1 && popitki_bukv == 1
    puts "Введите букву, у вас осталось #{popitki_bukv} попытка ввести буквы и #{popitki_slova} попыток ввести слово"
  elsif popitki_slova == 1 && popitki_bukv == 1
    puts "Введите букву или слово, у вас осталось #{popitki_bukv} попытка ввести буквы и #{popitki_slova} попытка ввести слово"
  elsif popitki_slova == 1 && popitki_bukv == [2, 3, 4]
    puts "Введите букву или слово, у вас осталось #{popitki_bukv} попытки ввести буквы и #{popitki_slova} попытка ввести слово"
  elsif popitki_slova != 1 && popitki_bukv == [2, 3, 4]
    puts "Введите букву, у вас осталось #{popitki_bukv} попытки ввести буквы и #{popitki_slova} попыток ввести слово"
  end
  answer = gets.chomp.downcase

  #если ответ - слово
  if (answer.size > 1)
    if (answer == text) && (popitki_slova == 1)
      puts "Вы угадали!"
      shifr = text
      user_point = answer.size
    elsif popitki_slova != 1
      puts "но у вас нет больше попыток угадать слово"
    else
      puts "Вы не угадали "
    end
    popitki_slova = 0
  end

  #если ответ - буква
  if (answer.size == 1) && (popitki_bukv > 0)
    if (text[answer] != nil)
      puts "Вы угадали"
      user_point = user_point + 1
      while text[answer] != nil
        shifr[text.index(answer)] = answer
        text[answer] = "*"
      end
      puts shifr
    elsif text[answer] == nil
      popitki_bukv = popitki_bukv - 1
      puts "Вы не угадали"
      puts shifr

    end
  elsif (answer.size == 1) && (popitki_bukv == 0)
    puts "но у вас нет больше попыток ввести букву"
  end
end

print "Игра закончена! "
if shifr.include? "*"
  print "Вы не угадали слово! Зато "
else
  print "Вы удалили слово! И "
end
if user_point == 1
  puts "вы набрали #{user_point} бaлл"
elsif user_point == [2, 3, 4]
  puts "вы набрали #{user_point} бaллa"
else
  puts "вы набрали #{user_point} бaллов"
end

require 'httparty'
site = 'http://localhost:3000/halloffame'#'http://rubyboosters.herokuapp.com/halloffame'
post_options = {
    body:
        {
            user: user_name,
            score: user_point
        }
}

get_options = {
    body:
        {
            user: user_name
        }
}
response = HTTParty.post(site, post_options)
puts JSON.parse(response.body)
post_options[:body][:score] = 2
response = HTTParty.post(site, post_options)
puts JSON.parse(response.body)
response = HTTParty.get(site, get_options)
arr = JSON.parse(response.body).to_a
puts arr[0]
puts "User: #{arr[0]['user']}\nScore: #{arr[0]['score']}"