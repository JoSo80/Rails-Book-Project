require "csv"

Book.delete_all
Publisher.delete_all

filename = Rails.root.join("db/100.Books.csv")

puts "Loading Books from the CSV file: #{filename}"

csv_data = File.read(filename)
bookz = CSV.parse(csv_data, headers: true, encoding: "iso-8859-1")

bookz.each do |b|
  publisher = Publisher.find_or_create_by(name: b["publisher"])

  if publisher&.valid?
    book = publisher.books.create(
      title:            b["title"],
      author:           b["authors"],
      publication_year: b["publication_year"],
      number_of_pages:  b["num_pages"],
      average_rating:   b["average_rating"]
    )

    puts "invalid book #{b['title']}" unless book&.valid?
  else
    puts "invalid publisher #{b['publisher']} for book #{b['title']}."
  end
end

puts "Created #{Publisher.count} Publishers"
puts "Created #{Book.count} Books"
