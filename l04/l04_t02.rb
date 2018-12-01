
puts "Введите сумму в рублях, которую вы готовы откладывать на депозит ежемесячно"
mounthly_payment = gets.to_i
puts "Введите количество лет, через которые вы хотите получить накопления?"
years = gets.to_i
puts "Введите количество месяцев, через которые вы хотите получить накопления?"
mounth = gets.to_i
mounth = mounth + years * 12
schet = mounthly_payment
while mounth > 0
  schet = schet + schet*0.07/12 + mounthly_payment
  mounth = mounth - 1
end
puts "На вашем счету будет #{schet.round(2)}"