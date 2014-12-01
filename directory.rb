#first we put all students into an array
students = [
"Mr. Pink",
"Mr. Brown",
"Mr. Orange",
"Mr. Blue",
"Mr. Red"
]

#Now we iterate over each student and puts their name to the screens
puts "The students of my cohort at Makers Academy"
puts "-------------"
students.each { |student| puts student }

#finally we print the total
puts "Overall we have #{students.length} great students!"

