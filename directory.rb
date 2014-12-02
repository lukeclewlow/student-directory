system "clear"    

@linewidth = 100

puts ""
puts "Welcome to the student database".center(@linewidth)
puts "===============================".center(@linewidth)

@students = []

def menu
    puts ""
    puts "Please select an option: ".center(@linewidth)
    puts "------------------------".center(@linewidth)
    puts ""
    puts "1. Input student details"
    puts "2. Show list of students"
    puts "9. Exit"
    puts ""
end

def print_list
    print_header
      if @students.size > 0
        list(@students)
        print_footer(@students)
      else
        puts "There is currently no student information stored in the directory."  
        puts ""
      end
end


def interactive_menu
  loop do
    menu
    selection = gets.chomp
    case selection
      when "1" 
        @students = input_info
      when "2" 
        print_list
      when "9"
      else puts "Please select from the list."
    end
  end
end



def input_info
  puts "Please enter all requested information.".center(@linewidth)
  puts ""
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
        @students << {:name => name, :cohort => cohort, :nationality => nationality, :age => age}    
        puts ""
        puts "Now we have #{@students.length} students".center(@linewidth)
        puts "If you have no more student's to enter, press RETURN to finish.".center(@linewidth)
        puts ""
        print "Please enter student's name?: "
        name = gets.chomp.to_sym
      end
    @students
end	


def print_header
  puts ""
  puts "-------------".center(@linewidth)
  puts "The students of my cohort at Makers Academy".center(@linewidth)
  puts "-------------".center(@linewidth)
  puts ""
end


def list_while(students)
  index = 0
    while index < @students.length 
      puts "#{@students[index][:name]}, #{@students[index][:cohort]}, #{@students[index][:nationality]}, #{@students[index][:age]}"
      index += 1
    end
end


def list(students)
      puts "Which month's cohort would you like to see? (Leave blank for all)"
      month = gets.chomp
        if month == ""
            @students.each_with_index do | student, index |  
            puts "#{index + 1}: #{student[:name]}, #{student[:cohort]}, #{student[:nationality]}, #{student[:age]}"
          end  
        else
        @students.each_with_index do | student, index |
            if @students[index][:cohort] == month
          puts "#{index + 1}: #{student[:name]}, #{student[:cohort]}, #{student[:nationality]}, #{student[:age]}"
            end
          end
        end
end


def list_cohort(students)
  @students.sort_by! { |x| x[:cohort] }  
  @students.each_with_index do | student,  index | 
    puts "#{index + 1}: #{student[:name]}, #{student[:cohort]}, #{student[:nationality]}, #{student[:age]}" 
  end
end


def print_footer(students)
  if
    @students.length == 1
    puts ""
    puts "Overall, we have #{@students.length} great student.".center(@linewidth)
    puts "" 
  else
    puts ""
    puts "Overall, we have #{@students.length} great students.".center(@linewidth)
    puts "" 
  end
end

interactive_menu
#students = input_info
#system "clear"
#print_header
#list_cohort(students)
#list_while(students)
#  if students.length > 0
#    list(students)
#    print_footer(students)
#  else
#    puts "There is currently no student information stored in the directory."  
#    puts ""
#  end