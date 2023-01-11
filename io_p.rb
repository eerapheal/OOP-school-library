require 'json'
require_relative 'book'
require_relative 'rental'
require_relative 'student_s'
require_relative 'teacher_t'

module SaveData
  def save_books
    return unless File.exist?('./data_file/books.json')
    return unless @books.any?

    books_data = JSON.generate(@books, { max_nesting: false })
    File.write('./data_file/books.json', books_data)
  end

  def save_people
    return unless File.exist?('./data_file/people_p.json')
    return unless @people.any?

    people_data = JSON.generate(@people, { max_nesting: false })
    File.write('./data_file/people_p.json', people_data)
  end

  def save_rentals
    return unless File.exist?('./data_file/rental.json')
    return unless @rentals.any?

    rentals_data = JSON.generate(@rentals, { max_nesting: false })
    File.write('./data_file/rental.json', rentals_data)
  end

  def save()
    save_books
    save_people
    save_rentals
  end
end

module LoadData
  def load_books
    books = []
    if File.exist?('./data_file/books.json')
      data = File.read('./data_file/books.json')
      if data != ''
        JSON.parse(data).map do |book|
          books.push(Book.new(book['title'], book['author'], book['id']))
        end
      end
    end
    books
  end

  def load_people
    people = []
    if File.exist?('./data_file/people_p.json')
      data = File.read('./data_file/people_p.json')
      if data != ''
        JSON.parse(data).map do |person|
          if person['json_class'] == 'Student'
            people.push(Student.new(person['name'], person['age'], person['parent_permission'], person['id']))
          else
            people.push(Teacher.new(person['name'], person['age'], person['specialization'], person['id']))
          end
        end
      end
    end
    people
  end

  def load_rentals
    rentals = []
    if File.exist?('./data_file/rental.json')
      data = File.read('./data_file/rental.json')
      if data != ''
        JSON.parse(data).map do |rental|
          person_id = rental['person']['id']
          book_id = rental['book']['id']
          rentals.push(Rental.new(get_person(person_id), get_book(book_id), rental['date']))
        end
      end
    end
    rentals
  end

  def get_person(id)
    @people.find { |person| person.id == id }
  end

  def get_book(id)
    @books.find { |book| book.id == id }
  end
end