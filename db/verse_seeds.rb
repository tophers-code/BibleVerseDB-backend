# db/verse_seeds.rb
# Loaded by db/seeds.rb after bible_books and categories are seeded.
# Add new verse batches here grouped by book as your study grows.

puts "Seeding additional verses..."

# ------------------------------------------------------------
# GENESIS (additions)
# ------------------------------------------------------------

genesis_verses_additions = [
  {
    chapter: 19, verse_start: 4, verse_end: 8,
    notes: "The men of Sodom demand Lot's visitors; Lot pleads with them not to act wickedly",
    categories: [
      { name: "Hamartiology", notes: "The men of Sodom exemplify collective, unrestrained sin" },
      { name: "Ponerology", notes: "The nature of evil on display in the wickedness of Sodom" }
    ]
  },
]

# ------------------------------------------------------------
# EXODUS
# ------------------------------------------------------------

exodus_verses = [
  {
    chapter: 3, verse_start: 14, verse_end: nil,
    notes: '"I AM WHO I AM" — God reveals his divine name and self-existence to Moses',
    categories: [
      { name: "Theology", notes: "God's self-revelation as the self-existent, eternal I AM" }
    ]
  },
  {
    chapter: 20, verse_start: 5, verse_end: nil,
    notes: 'Highlighted word: "jealous" — God explicitly identifies himself as a jealous God',
    categories: [
      { name: "Theology", notes: "God's attribute of jealousy — he will not share his glory or worship with another" }
    ]
  },
  {
    chapter: 29, verse_start: 36, verse_end: 37,
    notes: '"Atonement" appears three times — sin offering for atonement, make atonement for the altar',
    categories: [
      { name: "Soteriology", notes: "God's prescribed ritual atonement for sin through sacrifice" }
    ]
  },
  {
    chapter: 30, verse_start: 10, verse_end: nil,
    notes: '"Atonement" appears twice — blood of the sin offering of atonement, made once per year',
    categories: [
      { name: "Soteriology", notes: "Annual atonement on the altar foreshadowing the once-for-all atonement of Christ" }
    ]
  },
  {
    chapter: 30, verse_start: 15, verse_end: 16,
    notes: '"Atonement" appears three times — atonement money given to make atonement for your lives',
    categories: [
      { name: "Soteriology", notes: "Ransom/atonement payment as a covering for sin before God" }
    ]
  },
  {
    chapter: 34, verse_start: 6, verse_end: 7,
    notes: "God proclaims his own attributes to Moses — the foundational self-description of God's character",
    categories: [
      { name: "Theology", notes: "God's attributes: merciful, gracious, slow to anger, abounding in steadfast love and faithfulness, forgiving" }
    ]
  },
  {
    chapter: 34, verse_start: 35, verse_end: nil,
    notes: "Moses' face shines from being in God's presence — reflects the glory of God",
    categories: [
      { name: "Theology", notes: "The glory of God physically manifested on Moses after speaking with the LORD" }
    ]
  },
]

# ------------------------------------------------------------
# ROMANS
# ------------------------------------------------------------

romans_verses = [
  {
    chapter: 2, verse_start: 4, verse_end: nil,
    notes: 'Red underline; red box around "repentance" — God\'s kindness is meant to lead you to repentance',
    categories: [
      { name: "Soteriology", notes: "God's kindness and patience as the mechanism that draws people toward repentance" }
    ]
  },
  {
    chapter: 2, verse_start: 5, verse_end: nil,
    notes: 'Brown underline; red box around "storing up wrath"; "the day of wrath" highlighted — hard and impenitent heart storing up wrath for the day of judgment',
    categories: [
      { name: "Hamartiology", notes: "The hardened, impenitent heart actively accumulates divine wrath through unrepentant sin" },
      { name: "Eschatology", notes: "The day of wrath — God's righteous judgment will be revealed at the end" }
    ]
  },
  {
    chapter: 2, verse_start: 6, verse_end: nil,
    notes: 'Red underline — God will render to each one according to his works',
    categories: [
      { name: "Eschatology", notes: "Final judgment rendered according to works" }
    ]
  },
  {
    chapter: 2, verse_start: 7, verse_end: nil,
    notes: 'Red underline on "he will give eternal life" (v7b only)',
    categories: [
      { name: "Soteriology", notes: "Eternal life given to those who by patience in well-doing seek glory and honor and immortality" },
      { name: "Eschatology", notes: "Eternal life as the eschatological reward for perseverance in doing good" }
    ]
  },
  {
    chapter: 2, verse_start: 12, verse_end: nil,
    notes: 'Red underline — all who sinned without the law perish without the law; all who sinned under the law judged by the law',
    categories: [
      { name: "Hamartiology", notes: "Universal guilt before God — sin brings judgment whether under the law or not" }
    ]
  },
  {
    chapter: 2, verse_start: 14, verse_end: 15,
    notes: 'Collapsed entry: red underline on "are a law to themselves" (v14); red underline on "the law is written on their hearts" (v15a); blue underline on "their conscience also bears witness...accuse or even excuse them" (v15b)',
    categories: [
      { name: "Theological Anthropology", notes: "Natural law written on the human heart; conscience as an innate moral witness pointing to humanity's accountability before God" }
    ]
  },
  {
    chapter: 2, verse_start: 16, verse_end: nil,
    notes: 'Brown underline on "on that day when" — God judges the secrets of men by Christ Jesus',
    categories: [
      { name: "Eschatology", notes: "The day of judgment when God judges the hidden secrets of all people through Christ Jesus" }
    ]
  },
  {
    chapter: 3, verse_start: 10, verse_end: nil,
    notes: 'Light blue underline on "as it is written:" — citation introduction referencing OT scripture',
    categories: [
      { name: "Bibliology", notes: "Paul's use of OT scripture demonstrates cross-book corroboration — the Bible's books validate and reference one another as unified, authoritative teaching" }
    ]
  },
  {
    chapter: 3, verse_start: 19, verse_end: nil,
    notes: 'Black underline on "the whole world may be held accountable to God" (v19b only)',
    categories: [
      { name: "Hamartiology", notes: "Universal human accountability before God — no one is exempt from judgment" }
    ]
  },
  {
    chapter: 3, verse_start: 20, verse_end: nil,
    notes: 'Red underline — by works of the law no human being will be justified; through the law comes knowledge of sin',
    categories: [
      { name: "Hamartiology", notes: "The law's function is to reveal sin, not remove it" },
      { name: "Soteriology", notes: "Justification cannot come through works of the law — pointing to the need for another means of salvation" }
    ]
  },
  {
    chapter: 3, verse_start: 21, verse_end: 22,
    notes: 'Yellow underline on righteousness of God manifested apart from the law through faith in Jesus Christ, for all who believe',
    categories: [
      { name: "Theology", notes: "God's righteousness manifested apart from the law — a new revelation of his character through Christ" }
    ]
  },
  {
    chapter: 3, verse_start: 22, verse_end: nil,
    notes: 'Purple highlight on "faith in Jesus Christ"',
    categories: [
      { name: "Christology", notes: "Faith directed specifically toward Jesus Christ as the object of saving trust" },
      { name: "Soteriology", notes: "Faith in Jesus Christ as the instrument of justification for all who believe" }
    ]
  },
  {
    chapter: 3, verse_start: 22, verse_end: 25,
    notes: 'Red highlight — "all who believe...For there is no distinction...to be received by faith"',
    categories: [
      { name: "Soteriology", notes: "Universal availability of salvation by faith — no distinction between Jew and Greek; all have sinned and all may be justified" }
    ]
  },
  {
    chapter: 3, verse_start: 24, verse_end: 25,
    notes: 'Purple highlight on "through the redemption that is in Christ Jesus...by his blood"',
    categories: [
      { name: "Christology", notes: "Christ's redemptive work accomplished through his blood — the atoning death of Christ as the ground of justification" },
      { name: "Soteriology", notes: "Redemption and propitiation through Christ's blood received by faith" }
    ]
  },
  {
    chapter: 3, verse_start: 25, verse_end: 26,
    notes: 'Yellow highlight — "This was to show God\'s righteousness...the one who has faith in Jesus"',
    categories: [
      { name: "Soteriology", notes: "The atonement vindicates God's justice while justifying the one who has faith in Jesus" },
      { name: "Theology", notes: "God's righteousness demonstrated through the cross — he is both just and the justifier" }
    ]
  },
  {
    chapter: 3, verse_start: 30, verse_end: nil,
    notes: 'Yellow highlight on "God is one"',
    categories: [
      { name: "Theology", notes: "The oneness of God — monotheism as the foundation for the universal scope of justification by faith" }
    ]
  },
  {
    chapter: 4, verse_start: 2, verse_end: nil,
    notes: 'Red highlight — "was justified by works...counted to him as righteousness"',
    categories: [
      { name: "Soteriology", notes: "Righteousness counted/imputed — not earned by works but credited by God" }
    ]
  },
  {
    chapter: 4, verse_start: 5, verse_end: nil,
    notes: 'Red highlight — "believes in him who justifies the ungodly...faith is counted as righteousness"',
    categories: [
      { name: "Soteriology", notes: "God justifies the ungodly — faith counted as righteousness apart from works" }
    ]
  },
]

# ------------------------------------------------------------
# Insertion logic — shared helper
# ------------------------------------------------------------

seed_verses = lambda do |book_name, verses|
  book = BibleBook.find_by!(name: book_name)
  verses.each do |verse_data|
    verse = Verse.find_or_create_by!(
      bible_book: book,
      chapter: verse_data[:chapter],
      verse_start: verse_data[:verse_start],
      verse_end: verse_data[:verse_end]
    ) do |v|
      v.notes = verse_data[:notes]
    end

    verse_data[:categories].each do |cat_data|
      category = Category.find_by!(name: cat_data[:name])
      VerseCategory.find_or_create_by!(verse: verse, category: category) do |vc|
        vc.notes = cat_data[:notes]
      end
    end
  end
  puts "Created #{Verse.count} verses with #{VerseCategory.count} category associations for #{book}"
end

seed_verses.call("Genesis", genesis_verses_additions)
seed_verses.call("Exodus", exodus_verses)
seed_verses.call("Romans", romans_verses)

puts "Additional verse seeding complete (#{Verse.count} total verses, #{VerseCategory.count} total category associations)"
