def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets
  name.chop! if name[-1] == "\r" || name[-1] == "\n"
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What cohort are they in?"
    cohort = gets.chomp.capitalize.to_sym
    if cohort.empty? == true then cohort = :November end
    puts "What country were they born in?"
    country = gets.chomp
    puts "What is their favourite hobby?"
    hobby = gets.chomp
    puts "How tall are they?"
    height = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: cohort, country: country, hobby: hobby, height: height}
    puts students.count == 1 ? "Now we have #{students.count} student" : "Now we have #{students.count} students"
    # get anther name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  cohorts = students.map {|student| student[:cohort]}.uniq
  cohorts.each do |cohort|
    students.each do |student|
      if student[:cohort] == cohort
        puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
        puts "Country: #{student[:country]}"
        puts "Hobby: #{student[:hobby]}"
        puts "Height: #{student[:height]}\n\n"
      end
    end
  end
end

def print_footer(students)
  puts students.count == 1 ? "Overall, we have #{students.count} great student" : "Overall, we have #{students.count} great students"
end

students = input_students
# nothing happens until we call the methods
print_header
print(students)
print_footer(students)
