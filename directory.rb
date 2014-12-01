#first we put all students into an array
students = [
	{:name => "Mr. Pink", :cohort => :november},
	{:name => "Ms. Brown", :cohort => :november},
	{:name => "Miss. Orange", :cohort => :november},
	{:name => "Mr. Blue", :cohort => :november},
	{:name => "Mrs. Red", :cohort => :november}
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------"
end

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end

def print_footer(names)
	puts "Overall, we have #{names.length} great students."
end

#nothing happens until we call the methods

print_header
print(students)
print_footer(students)

