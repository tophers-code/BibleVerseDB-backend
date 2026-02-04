namespace :categories do
  desc "Add Ouranology category"
  task add_ouranology: :environment do
    Category.find_or_create_by!(name: "Ouranology") do |c|
      c.meaning = "Study of Heaven"
      c.color_code = "light-orange"
    end
    puts "Ouranology category added successfully!"
  end

  desc "Sync categories from seeds (adds missing categories)"
  task sync: :environment do
    categories = [
      { name: "Theology", meaning: "Study of God", color_code: "yellow" },
      { name: "Christology", meaning: "Study of Christ", color_code: "purple" },
      { name: "Pneumatology", meaning: "Study of Holy Spirit", color_code: "orange" },
      { name: "Theological Anthropology", meaning: "Study of Humanity", color_code: "blue" },
      { name: "Bibliology", meaning: "Study of the Bible", color_code: "teal" },
      { name: "Angelology", meaning: "Study of Angels", color_code: "pink" },
      { name: "Demonology", meaning: "Study of Demons / Fallen Angels", color_code: "pink-black" },
      { name: "Hamartiology", meaning: "Study of Sin", color_code: "red-black" },
      { name: "Ponerology", meaning: "Study of Evil (the nature, existence)", color_code: "black" },
      { name: "Soteriology", meaning: "Study of Salvation", color_code: "red" },
      { name: "Ecclesiology", meaning: "Study of the Church", color_code: "green" },
      { name: "Missiology", meaning: "Study of the mission of the Church", color_code: "light-green" },
      { name: "Eschatology", meaning: "Study of the End Times", color_code: "brown" },
      { name: "Ouranology", meaning: "Study of Heaven", color_code: "light-orange" }
    ]

    categories.each do |cat|
      Category.find_or_create_by!(name: cat[:name]) do |c|
        c.meaning = cat[:meaning]
        c.color_code = cat[:color_code]
      end
    end

    puts "Categories synced! Total: #{Category.count}"
  end
end
