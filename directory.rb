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
        cohort = gets.strip.downcase.capitalize
        #If cohort is left empty it is assigned a standard value
        if cohort.empty?
            cohort = "August"
        end
        #Uses date library to check whether the cohort entered is a valid month
        while !Date::MONTHNAMES.include?(cohort)
            puts "Invalid input, please enter a month. e.g. 'January'or 'February'"
            cohort = gets.strip
        end
        puts "What is #{name}'s favourite hobby?"
        hobby = gets.strip.capitalize
        puts "What's their nationality?"
        nationality = gets.strip.capitalize
        puts "What's their favourite colour?"
        colour = gets.strip.capitalize
        #add the student hash to the array
        students << {name: name, cohort: cohort.to_sym, hobby: hobby, nationality: nationality, colour: colour}
        puts "Now we have #{students.count} students"
        #get another name from the user
        puts "Enter another student's name or press return to exit"
        name = gets.strip.capitalize
    end
    # return the array of students
    students
end

def print_header
    puts "The students of my cohort at Makers Academy"
    puts "-------------"
end

def print(students)
    puts "Name".ljust(15) + "Cohort".ljust(20) + "Hobby".ljust(15) + "Nationality".ljust(20) + "Colour".ljust(15)
    puts "--------------------------------------------------------------------------------"
    students.each do |student|
            puts "#{student[:name]}".ljust(15) + "#{student[:cohort]} cohort".ljust(20) + "#{student[:hobby]}".ljust(15) + "#{student[:nationality]}".ljust(20) + "#{student[:colour]}".ljust(15)
    end
end

def print_by_cohorts(students)
    cohorts = students.map { |student| student[:cohort] }
    
    cohorts.uniq.each do |month|
        puts month
        puts "-------"
        puts "Name".ljust(15) + "Hobby".ljust(15) + "Nationality".ljust(20) + "Colour".ljust(15)
        puts "--------------------------------------------------------------------------------"
        students.each do |student|
            if student[:cohort] == month
                puts "#{student[:name]}".ljust(15) + "#{student[:hobby]}".ljust(15) + "#{student[:nationality]}".ljust(20) + "#{student[:colour]}".ljust(15)
            end
        end
        puts "\n"
    end
end

def print_footer(names)
    if names.count > 1
        puts "Overall, we have #{names.count} great students"
    else
        puts "Overall, we have #{names.count} great student"
    end
end

students = input_students
print_header
print_by_cohorts(students)
print_footer(students)