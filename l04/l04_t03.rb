arr = File.readlines('noun_dictionary.txt').each {|l| l.chomp!}
arr = arr.uniq.each {|a| a.downcase!}
word = arr[rand(arr.size)]
puts "Введи слово на букву #{word[-1]}"
answer = gets.chomp.downcase
while (word[-1] == answer[0]) && (arr.include?(answer))
  puts "Правильно! Теперь введи слово на #{answer[-1]}"
  word = answer
  arr = arr - answer.split
  answer = gets.chomp.downcase
end
puts "Игра закончена"