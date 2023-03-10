class Rental
  attr_accessor :date, :rentals, :book

  attr_reader :person, :id

  def initialize(person, book, date)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'book' => @book,
      'person' => @person
    }.to_json(*args)
  end
end
