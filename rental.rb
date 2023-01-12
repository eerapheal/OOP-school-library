class Rental
  attr_accessor :date, :rentals

  attr_reader :person, :book, :id

  def initialize(person, book, date)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  def to_json(*)
    {
      JSON.create_id => self.class.name,
      'date' => @date,
      'book' => @book,
      'person' => @person
    }
  end
end
