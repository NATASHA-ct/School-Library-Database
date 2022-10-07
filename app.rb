#APP class inherits from all files
require './person'
require './student'
require './teacher'
require './rental'
require './book'
require './classroom'
require './nameable'
require './decorator'
require './capitalizedecorator'
require './trimmerdecorator'

class App
  attr_accessor :people, :book, :rental

  #App constructors
  def initialize()
    @people = []
    @books = []
    @book = nil
    @rentals = []
    @person = nil
  end
  #methods for all required functionalities
    def list_all_books
        if @books.length.zero?
        puts 'You don\'t have any books'
        else
        @books.each_with_index do |bk, index|
            puts "#{index}) Title: #{bk.title}, Author: #{bk.author}"
          end
        end
    end

    def list_all_people
            if @people.length.zero?
        puts 'You need at least one person'
        else
        @people.map.each_with_index do |person, index|
            puts "#{index}) [#{person.classroom}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
        end
        end
    end

    def create_student
        puts 'Great! let\'s create the student!'
        print 'Student age: '
        stdage = gets.chomp.to_i
        print 'Student name: '
        stdname = gets.chomp
        print 'Student class: '
        std_class = gets.chomp
        print 'Parent permission? true/ false: '
        stdparpermission = gets.chomp
        case stdparpermission
        when 'true'
        @people.push(Student.new(stdage, std_class, stdname, true))
        when 'false'
        @people.push(Student.new(stdage, std_class, stdname, false))
        else
        puts 'That was an invalid entry'
        end

        puts 'Student is created successfully'
  end

    def create_a_person
       print 'Hello! Would you like to create a:
        1. Student
        2. Teacher
        Choose between the two: '
        choice = gets.chomp.to_i

        case choice
    when 1
      create_student

    when 2
      puts 'Great! let\'s create the Teacher!'
      print 'Teacher age: '
      teacher_age = gets.chomp.to_i
      print 'Teacher name: '
      teacher_name = gets.chomp
      print 'Teacher specialization: '
      teacher_specs = gets.chomp
      teacher_permission = true
      @people.push(Teacher.new(teacher_age, teacher_name, teacher_specs, 'junior', teacher_permission))
      puts 'Teacher is created successfully'
    end
  end
    

    def create_a_book
    end

    def create_a_rental
    end

    def list_all_rentals_id
    end

    def quit_app
    end
end


