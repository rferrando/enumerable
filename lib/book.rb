class Book
  attr_reader :title
  attr_reader :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def ==(other)
    (@title == other.title && @author == other.author)
  end
end
