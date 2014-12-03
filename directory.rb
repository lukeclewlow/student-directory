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
    puts "3. Save the list of students"
    puts "9. Exit"
    puts ""
end

def print_list
      if @students.size > 0
        print_header
        list(@students)
        print_footer(@students)
      else
        puts ""
        puts "There is currently no student information stored in the directory."  
        puts ""
        sleep(1)
        system "clear"
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
      when "3"
        save_students
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


def save_students
  file= File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:nationality], student[:age]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end


interactive_menu


