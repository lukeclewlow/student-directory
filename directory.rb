require "Formatador" 

@lw = 100

puts ""
puts "Welcome to the student database".center(@lw)
puts "===============================".center(@lw)

@students = []
@student = []

def menu
    puts ""
    puts "Please select an option: ".center(@lw)
    puts "------------------------".center(@lw)
    puts ""
    puts "1. Input student details"
    puts "2. Show list of students"
    puts "3. Save list of students"
    puts "4. Load list of students"
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
    process(gets.chomp)
  end
end
    
def process(selection)
    case selection
      when "1" 
        @students = info
      when "2" 
        print_list
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        quit
      else puts "Please select from the list."
    end
end

def quit
  puts ""
  puts "---------THANK YOU FOR USING STUDENT DIRECTORY---------".center(@lw)
  puts ""
  sleep(2)
  system "clear"
  exit
end

def info
  puts "Please enter all requested information.".center(@lw)
  puts ""
  questions = [:name, :cohort, :nationality, :age]
  questions.each do |q|
    print "Please enter students #{q}: "
    answer = STDIN.gets.chomp.to_sym
    @student << { q => "#{answer}" }
    @hold = @student.reduce(:merge)
  end
  @students << @hold
  @students
end


def print_header
  puts ""
  puts "-------------".center(@lw)
  puts "The students of my cohort at Makers Academy".center(@lw)
  puts "-------------".center(@lw)
  puts ""
end


def list(students)
      puts "Please enter a month relating to the cohort you wish to view (leave blank to see all.)".center(@lw)
      month = STDIN.gets.chomp
        if month == ""
            Formatador.display_table(@students, [:name, :cohort, :nationality, :age]) #added gem that enable tables to be displayed
            #@students.each_with_index do | student, index |  
            #puts "#{index + 1}: #{student[:name]}, #{student[:cohort]}, #{student[:nationality]}, #{student[:age]}"   
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
    puts "Overall, we have #{@students.length} great student.".center(@lw)
    puts "" 
  else
    puts ""
    puts "Overall, we have #{@students.length} great students.".center(@lw)
    puts "" 
  end
end


def save_students(filename = "students.csv")
  puts "Select where to save the file."
  filename = gets.chomp
  file = File.open(filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:nationality], student[:age]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts ""
  puts "Saved..."
  puts ""
end

def add_student(name, cohort, nationality, age)
    @students << {:name => name, :cohort => cohort.to_sym, :nationality => nationality, :age => age}
end


def load_students(filename = "students.csv")
  puts "Please select a file from the list below or leave blank to load default."
  system "ls"
  filename = gets.chomp
    if filename = ""
       filename = "students.csv"
    end
  puts ""
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, nationality, age = line.chomp.split(',')
  add_student(name, cohort, nationality, age)  
  end
  file.close
end


def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.length} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist. Please try again"
    puts ""
    exit
  end
end

system "clear"
try_load_students
interactive_menu


