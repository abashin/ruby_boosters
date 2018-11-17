def conclusion_statistic_line(certain_char_qnt, qnt_statistic_lines, statistic_line_number, statistic_max_value)
  certain_char_qnt_statistic = (certain_char_qnt/(statistic_max_value / statistic_line_number)).round(0)
  if statistic_line_number < (qnt_statistic_lines - certain_char_qnt_statistic)
    print "  "
  end
  if statistic_line_number > (qnt_statistic_lines - certain_char_qnt_statistic)
    print "█ "
  end
end
arr = File.readlines('noun_dictionary.txt').each {|l| l.chomp!}
arr = arr.each {|a| a.downcase!}
arr = arr.join.split(//).each {|l| l.chomp!}
alphabit = ("a".."z").to_a
alphabit.sort! {|a1,a2| arr.count(a2) <=> arr.count(a1)}
crar_qnt = []
i = 0
while i < 26
  char_qnt = char_qnt + [arr.count(alphabit[i])]
  i = i + 1
end
statistic_line_number = 0
QNT_STATISTIC_LINES = 10
while statistic_line_number <= QNT_STATISTIC_LINES
  z = 0
  while z < 26
    conclusion_statistic_line(numbers[z], QNT_STATISTIC_LINES, statistic_line_number, char_qnt[0])
    z += 1
  end
  statistic_line_number += 1
  puts ""
end
alphabit.each{|letter| print letter, " "}