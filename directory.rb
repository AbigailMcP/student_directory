def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # ask for extra information
    puts "Please enter their favourite hobby"
    hobby = gets.chomp
    puts "Please enter their country of birth"
    birthplace = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, birthplace: birthplace}
    puts "Now we have #{students.count} students"
    # get anther name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print(students)
  students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort). Birthplace: #{student[:birthplace]}. Likes: #{student[:hobby]}"}
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
