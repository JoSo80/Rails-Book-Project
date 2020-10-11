require "csv"

Book.delete_all
Publisher.delete_all

filename = Rails.root.join("db/100.Books.csv")

puts "Loading Books from the CSV file: #{filename}"

csv_data = File.read(filename)
books = CSV.parse(csv_data, headers: true, encoding: "iso-8859-1")

books.each do |b|
  puts b["title"]
end
