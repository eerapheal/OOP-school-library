require './book'
require './student_s'

describe Book do
  context 'Testing the Book class' do
    title = 'E nor easy to code'
    author = 'E.E Raphael'
    book = Book.new(title, author)

    it 'should validate the title of the book' do
      expect(book.title).to eq title
    end

    it 'should validate the author of the book' do
      expect(book.author).to eq author
    end
  end
end