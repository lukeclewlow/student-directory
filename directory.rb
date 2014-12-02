puts ""
puts "Welcome to the student database"
puts "==============================="


def input_info
  puts "Please enter all requested information. To finish just press enter twice when prompted." 
  puts ""
  students = []
  print "Please enter student's name?:"
  name = gets.chomp
    while !name.empty? do 
      print "Please enter #{name}'s nationality?:"
      nationality = gets.chomp
      print "Please enter #{name}'s height?:"
      height = gets.chomp
      print "Please enter #{name}'s age?:"
      age = gets.chomp
    students << {:name => name, :nationality => nationality, :height => height, :age => age}    
    puts "Now we have #{students.length} students"
    puts "Please enter another student's name, or press RETURN to finish."
    name = gets.chomp
  end
  students
end	

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end



def list(students)
  students.each_with_index do | student, index |
    puts "#{index + 1}: #{student[:name]}, #{student[:nationality]}, #{student[:height]}, #{student[:age]}"
  end
end


def print_footer(names)
  puts ""
  puts "Overall, we have #{names.length} great students."
end


students = input_info
print_header
list(students)
print_footer(students)