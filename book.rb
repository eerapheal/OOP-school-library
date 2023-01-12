require_relative 'rental'

class Book
  attr_accessor :title, :author, :id
  attr_reader :rentals

  def initialize(title, author, id = Random.rand(1..1000))
    @id =id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_json(*args)
    {
      'id' => @id,
      'title' => @title,
      'author' => @author
    }.to_json(*args)
  end
end
