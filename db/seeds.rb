require "faker"

puts "🔄 Nettoyage des données..."
Item.delete_all
if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
  ActiveRecord::Base.connection.reset_pk_sequence!('items')
end

puts "✅ Données nettoyées."

puts "📦 Création de 20 articles..."

kittens=[
"https://images.pexels.com/photos/596590/pexels-photo-596590.jpeg",
"https://images.pexels.com/photos/416160/pexels-photo-416160.jpeg",
"https://images.pexels.com/photos/1870376/pexels-photo-1870376.jpeg",
 "https://images.pexels.com/photos/1444321/pexels-photo-1444321.jpeg",
 "https://images.pexels.com/photos/290164/pexels-photo-290164.jpeg",
 "https://images.pexels.com/photos/127028/pexels-photo-127028.jpeg",
 "https://images.pexels.com/photos/2061057/pexels-photo-2061057.jpeg",
 "https://images.pexels.com/photos/96938/pexels-photo-96938.jpeg",
"https://images.pexels.com/photos/257532/pexels-photo-257532.jpeg",
"https://images.pexels.com/photos/127027/pexels-photo-127027.jpeg",
"https://images.pexels.com/photos/1056251/pexels-photo-1056251.jpeg",
"https://images.pexels.com/photos/735423/pexels-photo-735423.jpeg",
"https://images.pexels.com/photos/1472999/pexels-photo-1472999.jpeg",
"https://images.pexels.com/photos/2194261/pexels-photo-2194261.jpeg",
"https://images.pexels.com/photos/2558605/pexels-photo-2558605.jpeg",
"https://images.pexels.com/photos/669015/pexels-photo-669015.jpeg",
"https://images.pexels.com/photos/1981111/pexels-photo-1981111.jpeg",
"https://images.pexels.com/photos/479009/pexels-photo-479009.jpeg",
"https://images.pexels.com/photos/171227/pexels-photo-171227.jpeg",
"https://images.pexels.com/photos/923360/pexels-photo-923360.jpeg"
]

20.times do
Item.create!(
    title: "chaton - "+Faker::Emotion.adjective,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Commerce.price(range: 0..100.0, as_string: true),
    image_url: kittens.sample
  )
end
puts "✅ Kittens ajoutés."
