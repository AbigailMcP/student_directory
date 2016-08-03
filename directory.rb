def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header(students)
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you mean, try again"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
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

def print_header(students)
  if !students.empty?
  puts "The students of Villains Academy"
  puts "-------------"
  end
end

def print(students)
  if !students.empty?
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
end

def print_footer(students)
  puts students.count == 1 ? "Overall, we have #{students.count} great student" : "Overall, we have #{students.count} great students"
end

interactive_menu
