require_relative './book'
require_relative './classroom'
require_relative './student_s'
require_relative './teacher_t'
require_relative './person_p'
require_relative './rental'

class App
  attr_reader :people, :books, :rentals
  def initialize
    @people = []
    @books =[]
    @rentals = []
    @welcome_text = "\nPlease choose an option by typing number
    1- List all books
    2- List all people
    3- Create a person
    4- Create a book
    5- Create a rental
    6- List all rentals for a given person id
    7- Exit
    " 
  end
  
end