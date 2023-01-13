require './rental'
require './book'
require './student_s'

describe Rental do
  context 'Testing the Rental class' do
    book = Book.new('Beauty queen', 'Wendy')
    student = Student.new('Ralph', 36, true)
    date = '1-12-2023'
    rental = Rental.new(student, book, date)

    it 'should validate the date of the rental' do
      expect(rental.date).to eq date
    end

    it 'should validate the person who rented the book' do
      expect(rental.person).to eq student
    end

    it 'should validate the book being rented' do
      expect(rental.book).to eq book
    end
  end
end