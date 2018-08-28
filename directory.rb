require 'date'
@students = []

def input_students
    puts "Please enter the names of the students followed by their information"
    puts "To finish, just hit return twice"
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
        @students << {name: name, cohort: cohort.to_sym, hobby: hobby, nationality: nationality, colour: colour}
        puts "Now we have #{@students.count} students"
        #get another name from the user
        puts "Enter another student's name or press return to exit"
        name = gets.strip.capitalize
    end
end

def print_header
    puts "The students of my cohort at Makers Academy"
    puts "-------------"
end

def print_students_list
    puts "Name".ljust(15) + "Cohort".ljust(20) + "Hobby".ljust(15) + "Nationality".ljust(20) + "Colour".ljust(15)
    puts "--------------------------------------------------------------------------------"
    @students.each do |student|
            puts "#{student[:name]}".ljust(15) + "#{student[:cohort]} cohort".ljust(20) + "#{student[:hobby]}".ljust(15) + "#{student[:nationality]}".ljust(20) + "#{student[:colour]}".ljust(15)
    end
end

def print_footer
    if @students.count > 1
        puts "Overall, we have #{@students.count} great students"
    else
        puts "Overall, we have #{@students.count} great student"
    end
end

def print_menu
        puts "1. Input the students"
        puts "2. Show the students"
        puts "9. Exit"
end

def process(selection)
    case selection
        when "1"
            input_students
        when "2"
            show_students
        when "9"
            exit
        else
            puts "I don't know what you mean, try again"
    end
end

def show_students
    print_header
    print_students_list
    print_footer
end

def interactive_menu
    loop do
        print_menu
        process(gets.chomp)
    end
end

interactive_menu