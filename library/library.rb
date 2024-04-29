class Library
    def analyze_library(books)
      raise ArgumentError, "Expected books to be an Array" unless books.is_a?(Array)
  
      return default_values if books.empty?
  
      {
        book_count: count_books(books),
        longest_book: find_longest_book(books),
        all_books_over_100_pages: check_all_books_over_100_pages(books),
        average_pages: calculate_average_pages(books)
      }
    end
  
    def count_books(books)
      return 0 unless books
      books.count
    end
  
    def find_longest_book(books)
      return nil unless books
      books.max_by { |book| book[:pages] }
    end
  
    def check_all_books_over_100_pages(books)
      return nil unless books
      books.all? { |book| book[:pages] >= 100 }
    end
  
    def calculate_average_pages(books)
      return 0 unless books
      total_pages = books.sum { |book| book[:pages] }
      total_pages.to_f / count_books(books)
    end
  
    private
  
    def default_values
      {
        book_count: 0,
        longest_book: nil,
        all_books_over_100_pages: false,
        average_pages: 0
      }
    end
  end
  