arr = File.readlines('noun_dictionary.txt').each {|l| l.chomp!}
puts "Введите буквы"
answer = gets
arr.delete_if {|x| x[answer] != nil}
if arr.max_by{ |elem| elem.size } == nil
  puts "Такого слова нет"
else
  puts arr.max_by{ |elem| elem.size }
end