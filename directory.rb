require 'csv'
@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process_menu(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "5. Exit"
end

def process_menu(selection)
  case selection
  when "1" then input_students
  when "2" then show_students
  when "3" then request_filename(selection)
  when "4" then request_filename(selection)
  when "5" then exit
  else
    puts "I don't know what you mean, try again"
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp   # get the first name
  while !name.empty? do   # while the name is not empty, repeat this code
    puts "What cohort are they in?"
    cohort = STDIN.gets.chomp.capitalize.to_sym
    if cohort.empty? == true then cohort = :November end
    # add the student hash to the array
    add_student(name,cohort)
    puts @students.count == 1 ? "Student successfully added. Now we have #{@students.count} student" : "Student successfully added. Now we have #{@students.count} students"
    # get anther name from the user
    puts "Enter another student, or hit return again to finish"
    name = STDIN.gets.chomp
  end
end

def add_student(name,cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print_students_list
    cohorts = @students.map {|student| student[:cohort]}.uniq
    cohorts.each do |cohort|
      @students.each do |student|
        if student[:cohort] == cohort
          puts "#{student[:name]} (#{student[:cohort].capitalize} cohort)"
        end
      end
    end
end

def print_footer
  puts "--------------------------------"
  puts @students.count == 1 ? "Overall, we have #{@students.count} great student" : "Overall, we have #{@students.count} great students"
  puts
end

def request_filename(selection)
  puts "Please enter a filename:"
  filename = STDIN.gets.chomp
  selection == "3" ? save_students(filename) : load_students(filename)
end

def save_students(filename = "students.csv")
  CSV.open(filename, "wb") do |csv|
    @students.each {|student| csv << [student[:name], student[:cohort]]}
  end
  puts "Save complete"
end

def load_students_startup
  filename = ARGV.first # first argument from the command line
  if filename.nil? then load_students
  elsif File.exists?(filename) then load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist"
    load_students
  end
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |line|
    add_student(line[0], line[1])
  end
  puts "Loaded #{@students.count} from #{filename}"
rescue
  puts "Sorry, that file does not exist. Loading failed."
end

load_students_startup
interactive_menu
