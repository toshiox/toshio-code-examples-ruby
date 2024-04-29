require 'rspec'
require_relative 'library'

RSpec.describe Library do
  before(:each) do
    @library = Library.new
    @books = [
      { title: 'Book 1', pages: 200 },
      { title: 'Book 2', pages: 150 },
      { title: 'Book 3', pages: 300 },
      { title: 'Book 4', pages: 100 },
      { title: 'Book 5', pages: 250 }
    ]
  end

  it 'counts the number of books' do
    expect(@library.count_books(@books)).to eq(5)
  end

  it 'finds the longest book' do
    longest_book = @library.find_longest_book(@books)
    expect(longest_book[:title]).to eq('Book 3')
    expect(longest_book[:pages]).to eq(300)
  end

  it 'checks if all books have more than 100 pages' do
    expect(@library.check_all_books_over_100_pages(@books)).to be true
  end

  it 'calculates the average number of pages' do
    expect(@library.calculate_average_pages(@books)).to eq(200.0)
  end

  it 'analyzes the library' do
    metrics = @library.analyze_library(@books)
    expect(metrics[:book_count]).to eq(5)
    expect(metrics[:longest_book][:title]).to eq('Book 3')
    expect(metrics[:longest_book][:pages]).to eq(300)
    expect(metrics[:all_books_over_100_pages]).to be true
    expect(metrics[:average_pages]).to eq(200.0)
  end

  it 'handles nil books' do
    expect { @library.analyze_library("not an array") }.to raise_error(ArgumentError, "Expected books to be an Array")
  end

  it 'handles non-array books' do
    expect { @library.analyze_library("not an array") }.to raise_error(ArgumentError, "Expected books to be an Array")
  end

  it 'handles empty array of books' do
    metrics = @library.analyze_library([])
    expect(metrics[:book_count]).to eq(0)
    expect(metrics[:longest_book]).to be_nil
    expect(metrics[:all_books_over_100_pages]).to be false
    expect(metrics[:average_pages]).to eq(0)
  end
end
