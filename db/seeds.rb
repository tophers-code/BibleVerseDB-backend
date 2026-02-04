# Seed Bible Books (all 66 books with chapter counts)
bible_books = [
  # Old Testament (39 books)
  { name: "Genesis", abbreviation: "Gen", testament: :old_testament, book_order: 1, chapter_count: 50 },
  { name: "Exodus", abbreviation: "Exod", testament: :old_testament, book_order: 2, chapter_count: 40 },
  { name: "Leviticus", abbreviation: "Lev", testament: :old_testament, book_order: 3, chapter_count: 27 },
  { name: "Numbers", abbreviation: "Num", testament: :old_testament, book_order: 4, chapter_count: 36 },
  { name: "Deuteronomy", abbreviation: "Deut", testament: :old_testament, book_order: 5, chapter_count: 34 },
  { name: "Joshua", abbreviation: "Josh", testament: :old_testament, book_order: 6, chapter_count: 24 },
  { name: "Judges", abbreviation: "Judg", testament: :old_testament, book_order: 7, chapter_count: 21 },
  { name: "Ruth", abbreviation: "Ruth", testament: :old_testament, book_order: 8, chapter_count: 4 },
  { name: "1 Samuel", abbreviation: "1Sam", testament: :old_testament, book_order: 9, chapter_count: 31 },
  { name: "2 Samuel", abbreviation: "2Sam", testament: :old_testament, book_order: 10, chapter_count: 24 },
  { name: "1 Kings", abbreviation: "1Kgs", testament: :old_testament, book_order: 11, chapter_count: 22 },
  { name: "2 Kings", abbreviation: "2Kgs", testament: :old_testament, book_order: 12, chapter_count: 25 },
  { name: "1 Chronicles", abbreviation: "1Chr", testament: :old_testament, book_order: 13, chapter_count: 29 },
  { name: "2 Chronicles", abbreviation: "2Chr", testament: :old_testament, book_order: 14, chapter_count: 36 },
  { name: "Ezra", abbreviation: "Ezra", testament: :old_testament, book_order: 15, chapter_count: 10 },
  { name: "Nehemiah", abbreviation: "Neh", testament: :old_testament, book_order: 16, chapter_count: 13 },
  { name: "Esther", abbreviation: "Esth", testament: :old_testament, book_order: 17, chapter_count: 10 },
  { name: "Job", abbreviation: "Job", testament: :old_testament, book_order: 18, chapter_count: 42 },
  { name: "Psalms", abbreviation: "Ps", testament: :old_testament, book_order: 19, chapter_count: 150 },
  { name: "Proverbs", abbreviation: "Prov", testament: :old_testament, book_order: 20, chapter_count: 31 },
  { name: "Ecclesiastes", abbreviation: "Eccl", testament: :old_testament, book_order: 21, chapter_count: 12 },
  { name: "Song of Solomon", abbreviation: "Song", testament: :old_testament, book_order: 22, chapter_count: 8 },
  { name: "Isaiah", abbreviation: "Isa", testament: :old_testament, book_order: 23, chapter_count: 66 },
  { name: "Jeremiah", abbreviation: "Jer", testament: :old_testament, book_order: 24, chapter_count: 52 },
  { name: "Lamentations", abbreviation: "Lam", testament: :old_testament, book_order: 25, chapter_count: 5 },
  { name: "Ezekiel", abbreviation: "Ezek", testament: :old_testament, book_order: 26, chapter_count: 48 },
  { name: "Daniel", abbreviation: "Dan", testament: :old_testament, book_order: 27, chapter_count: 12 },
  { name: "Hosea", abbreviation: "Hos", testament: :old_testament, book_order: 28, chapter_count: 14 },
  { name: "Joel", abbreviation: "Joel", testament: :old_testament, book_order: 29, chapter_count: 3 },
  { name: "Amos", abbreviation: "Amos", testament: :old_testament, book_order: 30, chapter_count: 9 },
  { name: "Obadiah", abbreviation: "Obad", testament: :old_testament, book_order: 31, chapter_count: 1 },
  { name: "Jonah", abbreviation: "Jonah", testament: :old_testament, book_order: 32, chapter_count: 4 },
  { name: "Micah", abbreviation: "Mic", testament: :old_testament, book_order: 33, chapter_count: 7 },
  { name: "Nahum", abbreviation: "Nah", testament: :old_testament, book_order: 34, chapter_count: 3 },
  { name: "Habakkuk", abbreviation: "Hab", testament: :old_testament, book_order: 35, chapter_count: 3 },
  { name: "Zephaniah", abbreviation: "Zeph", testament: :old_testament, book_order: 36, chapter_count: 3 },
  { name: "Haggai", abbreviation: "Hag", testament: :old_testament, book_order: 37, chapter_count: 2 },
  { name: "Zechariah", abbreviation: "Zech", testament: :old_testament, book_order: 38, chapter_count: 14 },
  { name: "Malachi", abbreviation: "Mal", testament: :old_testament, book_order: 39, chapter_count: 4 },

  # New Testament (27 books)
  { name: "Matthew", abbreviation: "Matt", testament: :new_testament, book_order: 40, chapter_count: 28 },
  { name: "Mark", abbreviation: "Mark", testament: :new_testament, book_order: 41, chapter_count: 16 },
  { name: "Luke", abbreviation: "Luke", testament: :new_testament, book_order: 42, chapter_count: 24 },
  { name: "John", abbreviation: "John", testament: :new_testament, book_order: 43, chapter_count: 21 },
  { name: "Acts", abbreviation: "Acts", testament: :new_testament, book_order: 44, chapter_count: 28 },
  { name: "Romans", abbreviation: "Rom", testament: :new_testament, book_order: 45, chapter_count: 16 },
  { name: "1 Corinthians", abbreviation: "1Cor", testament: :new_testament, book_order: 46, chapter_count: 16 },
  { name: "2 Corinthians", abbreviation: "2Cor", testament: :new_testament, book_order: 47, chapter_count: 13 },
  { name: "Galatians", abbreviation: "Gal", testament: :new_testament, book_order: 48, chapter_count: 6 },
  { name: "Ephesians", abbreviation: "Eph", testament: :new_testament, book_order: 49, chapter_count: 6 },
  { name: "Philippians", abbreviation: "Phil", testament: :new_testament, book_order: 50, chapter_count: 4 },
  { name: "Colossians", abbreviation: "Col", testament: :new_testament, book_order: 51, chapter_count: 4 },
  { name: "1 Thessalonians", abbreviation: "1Thess", testament: :new_testament, book_order: 52, chapter_count: 5 },
  { name: "2 Thessalonians", abbreviation: "2Thess", testament: :new_testament, book_order: 53, chapter_count: 3 },
  { name: "1 Timothy", abbreviation: "1Tim", testament: :new_testament, book_order: 54, chapter_count: 6 },
  { name: "2 Timothy", abbreviation: "2Tim", testament: :new_testament, book_order: 55, chapter_count: 4 },
  { name: "Titus", abbreviation: "Titus", testament: :new_testament, book_order: 56, chapter_count: 3 },
  { name: "Philemon", abbreviation: "Phlm", testament: :new_testament, book_order: 57, chapter_count: 1 },
  { name: "Hebrews", abbreviation: "Heb", testament: :new_testament, book_order: 58, chapter_count: 13 },
  { name: "James", abbreviation: "Jas", testament: :new_testament, book_order: 59, chapter_count: 5 },
  { name: "1 Peter", abbreviation: "1Pet", testament: :new_testament, book_order: 60, chapter_count: 5 },
  { name: "2 Peter", abbreviation: "2Pet", testament: :new_testament, book_order: 61, chapter_count: 3 },
  { name: "1 John", abbreviation: "1John", testament: :new_testament, book_order: 62, chapter_count: 5 },
  { name: "2 John", abbreviation: "2John", testament: :new_testament, book_order: 63, chapter_count: 1 },
  { name: "3 John", abbreviation: "3John", testament: :new_testament, book_order: 64, chapter_count: 1 },
  { name: "Jude", abbreviation: "Jude", testament: :new_testament, book_order: 65, chapter_count: 1 },
  { name: "Revelation", abbreviation: "Rev", testament: :new_testament, book_order: 66, chapter_count: 22 }
]

puts "Seeding Bible books..."
bible_books.each do |book|
  BibleBook.find_or_create_by!(name: book[:name]) do |b|
    b.abbreviation = book[:abbreviation]
    b.testament = book[:testament]
    b.book_order = book[:book_order]
    b.chapter_count = book[:chapter_count]
  end
end
puts "Created #{BibleBook.count} Bible books"

# Seed Categories (from ologies.csv)
categories = [
  { name: "Theology", meaning: "God", color_code: "yellow" },
  { name: "Christology", meaning: "Christ", color_code: "purple" },
  { name: "Pneumatology", meaning: "Holy Spirit", color_code: "orange" },
  { name: "Theological Anthropology", meaning: "Humanity", color_code: "blue" },
  { name: "Bibliology", meaning: "the Bible", color_code: "teal" },
  { name: "Angelology", meaning: "Angels", color_code: "pink" },
  { name: "Demonology", meaning: "Demons / Fallen Angels", color_code: "pink-black" },
  { name: "Hamartiology", meaning: "Sin", color_code: "red-black" },
  { name: "Ponerology", meaning: "Evil (the nature, existence)", color_code: "black" },
  { name: "Soteriology", meaning: "Salvation", color_code: "red" },
  { name: "Ecclesiology", meaning: "the Church", color_code: "green" },
  { name: "Missiology", meaning: "the mission of the Church", color_code: "light-green" },
  { name: "Eschatology", meaning: "the End Times", color_code: "brown" },
  { name: "Ouranology", meaning: "Heaven", color_code: "light-orange" }
]

puts "Seeding categories..."
categories.each do |cat|
  Category.find_or_create_by!(name: cat[:name]) do |c|
    c.meaning = cat[:meaning]
    c.color_code = cat[:color_code]
  end
end
puts "Created #{Category.count} categories"

puts "Seeding complete!"
