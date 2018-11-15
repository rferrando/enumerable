class Bookcase
  def initialize(books)
    @books = books
  end

  ### Enumerable.find ###

  # Enumerable.each block.call version:
  def find(&block)
    @books.each do |book|
      return book if block.call(book)
    end
  end

  # Enumerable.each yield version:
  # def find
  #   @books.each do |book|
  #     return book if yield(book)
  #   end
  # end

  # Enumerable.find version:
  # def find
  #   @books.find { |book| yield(book) }
  # end

  ### Enumerable.select ###

  # Enumerable.each version
  def select
    selected_books = []

    @books.each do |book|
      selected_books.push(book) if yield(book)
    end

    selected_books
  end

  # Enumerable.select
  # def select(&block)
  #   @books.select { |book| block.call(book) }
  # end

  # Enumerable.select
  # def select
  #   @books.select { |book| yield(book) }
  # end

  ### Enumerable.map ###

  # Enumerable.each version
  def map
    new_collection = []

    @books.each do |book|
      new_collection.push(yield(book))
    end

    new_collection
  end

  # Enumerable.map version
  # def map
  #   @books.map { |book| yield(book) }
  # end

  ### Enumerable.count ###

  def count
    if block_given?
      @books.count { |book| yield(book) }
    else
      @books.count
    end
  end
end
