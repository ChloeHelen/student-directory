require 'date'

def input_students
    puts "Please enter the names of the students followed by their information"
    puts "To finish, just hit return twice"
    #create an empty array
    students = []
    #get the first name
    name = gets.chomp.capitalize
    #while the name is not empty, repeat this code
    while !name.empty? do
        puts "What cohort is #{name} a part of?"
        cohort = gets.chomp.downcase.capitalize
        #If cohort is left empty it is assigned a standard value
        if cohort.empty?
            cohort = "August"
        end
        #Uses date library to check whether the cohort entered is a valid month
        while !Date::MONTHNAMES.include?(cohort)
            puts "Invalid input, please enter a month. e.g. 'January'or 'February'"
            cohort = gets.chomp
        end
        puts "What is #{name}'s favourite hobby?"
        hobby = gets.chomp.capitalize
        puts "What's their nationality?"
        nationality = gets.chomp.capitalize
        puts "What's their favourite colour?"
        colour = gets.chomp.capitalize
        #add the student hash to the array
        students << {name: name, cohort: cohort.to_sym, hobby: hobby, nationality: nationality, colour: colour}
        puts "Now we have #{students.count} students"
        #get another name from the user
        puts "Enter another student's name or press return to exit"
        name = gets.chomp.capitalize
    end
    # return the array of students
    students
end

def print_header
    puts "The students of my cohort at Makers Academy"
    puts "-------------"
end

def print(students)
    puts "Name".ljust(15) + "Cohort".ljust(15) + "Hobby".ljust(15) + "Nationality".ljust(15) + "Colour".ljust(15)
    puts "--------------------------------------------------------------------------------"
    students.each do |student|
            puts "#{student[:name]}".ljust(15) + "#{student[:cohort]} cohort".ljust(15) + "#{student[:hobby]}".ljust(15) + "#{student[:nationality]}".ljust(15) + "#{student[:colour]}".ljust(15)
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)