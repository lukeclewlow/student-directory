system "clear"

linewidth = 100

puts ""
puts "Welcome to the student database".center(50)
puts "===============================".center(50)

def input_info
  puts "Please enter all requested information.".center(50)
  puts "To finish just press enter twice when prompted.".center(50)
  puts ""
  students = []
  print "Please enter student's name?: "
  name = gets.chomp.to_sym
    while !name.empty? do 
      print "Please enter #{name}'s cohort: "
      cohort = gets.chomp
        if cohort == ""
           cohort = "December"
        else
           cohort.capitalize.to_sym
        end
      print "Please enter #{name}'s nationality?: "
      nationality = gets.chomp.to_sym
      print "Please enter #{name}'s age?: "
      age = gets.chomp.to_sym
    students << {:name => name, :cohort => cohort, :nationality => nationality, :age => age}    
    puts ""
    puts "Now we have #{students.length} students".center(50)
    puts "If you have no more student's to enter, press RETURN to finish.".center(50)
    puts ""
    print "Please enter student's name?: "
    name = gets.chomp.to_sym
  end
  students
end	

def print_header
  puts ""
  puts "-------------".center(50)
  puts "The students of my cohort at Makers Academy".center(50)
  puts "-------------".center(50)
  puts ""
end


def list_while(students)
  index = 0
  while index < students.length 
      puts "#{students[index][:name]}, #{students[index][:cohort]}, #{students[index][:nationality]}, #{students[index][:age]}"
      index += 1
  end
end


#def list(students)
#  students.each_with_index do | student, index |
#    puts "#{index + 1}: #{student[:name]}, #{student[:cohort]}, #{student[:nationality]}, #{student[:age]}"
#  end
#end

def list_cohort(students)
  students.sort_by! { |x| x[:cohort] }  
    students.each_with_index do | student,  index | 
    puts "#{index + 1}: #{student[:name]}, #{student[:cohort]}, #{student[:nationality]}, #{student[:age]}" 
  end
end

def print_footer(names)
  puts ""
  puts "Overall, we have #{names.length} great students.".center(50)
  puts "" 
end


students = input_info
system "clear"
print_header
list_cohort(students)
#list_while(students)
#list(students)
print_footer(students)