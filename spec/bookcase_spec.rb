require 'book'
require 'bookcase'

RSpec.describe 'Bookcase' do
  before do
    @bookcase = [
      Book.new('Extreme Programming Explained', 'Kent Beck'),
      Book.new('Refactoring', 'Martin Fowler'),
      Book.new('Test-Driven Development by Example', 'Kent Beck'),
      Book.new('Patterns of Enterprise Application Architecture', 'Kent Beck'),
      Book.new('Implementation Patterns', 'Kent Beck'),
      Book.new('The Nature of Software Development', 'Ron Jeffries')
    ]
    @my_bookcase = Bookcase.new(@bookcase)
  end

  it 'finds specific book by title' do
    # Using for
    title = 'Extreme Programming Explained'

    desired_book = nil
    for book in @bookcase
      if book.title == title
        desired_book = book
      end
    end

    expect(desired_book).to eq(Book.new('Extreme Programming Explained', 'Kent Beck'))

    # Using Enumerable.each
    desired_book = nil
    @bookcase.each do |book|
      if book.title == title
        desired_book = book
      end
    end

    expect(desired_book).to eq(Book.new('Extreme Programming Explained', 'Kent Beck'))

    # Using Enumerable.find
    desired_book = @bookcase.find do |book|
      book.title == title
    end

    expect(desired_book).to eq(Book.new('Extreme Programming Explained', 'Kent Beck'))

    # Implementing Bookcase.find
    desired_book = @my_bookcase.find { |book| book.title == title }

    expect(desired_book).to eq(Book.new('Extreme Programming Explained', 'Kent Beck'))
  end

  it 'finds all books by author' do
    author = 'Ron Jeffries'

    # Using Enumerable.each
    desired_books = []
    @bookcase.each do |book|
      desired_books.push(book) if book.author == author
    end

    expect(desired_books).to include(Book.new('The Nature of Software Development', 'Ron Jeffries'))

    # Using Enumerable.select
    desired_books = @bookcase.select { |book| book.author == author }

    expect(desired_books).to include(Book.new('The Nature of Software Development', 'Ron Jeffries'))

    # Implementing Bookcase.select
    desired_books = @my_bookcase.select { |book| book.author == author }

    expect(desired_books).to include(Book.new('The Nature of Software Development', 'Ron Jeffries'))
  end

  it 'listing all titles of the bookcase' do
    # Using Enumerable.each
    titles = []
    @bookcase.each do |book|
      titles.push(book.title)
    end

    expect(titles).to eq(
      [
        'Extreme Programming Explained',
        'Refactoring',
        'Test-Driven Development by Example',
        'Patterns of Enterprise Application Architecture',
        'Implementation Patterns',
        'The Nature of Software Development'
      ]
    )

    # Using Enumerable.select
    titles = @bookcase.map { |book| book.title }

    expect(titles).to eq(
      [
        'Extreme Programming Explained',
        'Refactoring',
        'Test-Driven Development by Example',
        'Patterns of Enterprise Application Architecture',
        'Implementation Patterns',
        'The Nature of Software Development'
      ]
    )

    # Implementing Bookcase.select
    titles = @my_bookcase.map { |book| book.title }

    expect(titles).to eq(
      [
        'Extreme Programming Explained',
        'Refactoring',
        'Test-Driven Development by Example',
        'Patterns of Enterprise Application Architecture',
        'Implementation Patterns',
        'The Nature of Software Development'
      ]
    )
  end

  it 'counts all books' do
    # Using Enumerable.each
    number_of_books = 0

    @bookcase.each do |book|
      number_of_books = number_of_books + 1
    end

    expect(number_of_books).to eq(6)

    # Using Enumerable.count
    number_of_books = @bookcase.count

    expect(number_of_books).to eq(6)

    # Implementing MyBookcase.count
    number_of_books = @my_bookcase.count

    expect(number_of_books).to eq(6)
  end

  it 'counts books from same author' do
    author = 'Ron Jeffries'

    # Using Enumerable.each
    number_of_books = 0

    @bookcase.each do |book|
      number_of_books = number_of_books + 1 if book.author == author
    end

    expect(number_of_books).to eq(1)

    # Using Enumerable.select + count
    number_of_books = @bookcase
                        .select { |book| book.author == author }
                        .count

    expect(number_of_books).to eq(1)

    # Using Enumerable.count
    number_of_books = @bookcase.count { |book| book.author == author }

    expect(number_of_books).to eq(1)

    # Implementing MyBookcase.count
    number_of_books = @my_bookcase.count { |book| book.author == author }

    expect(number_of_books).to eq(1)
  end
end
