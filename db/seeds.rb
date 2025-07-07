require "faker"

puts "🔄 Nettoyage des données..."
Item.delete_all
if ActiveRecord::Base.connection.adapter_name == 'PostgreSQL'
  ActiveRecord::Base.connection.reset_pk_sequence!('items')
end

puts "✅ Données nettoyées."

puts "📦 Création de 20 articles..."

kittens_url =[
"https://www.pexels.com/fr-fr/photo/photo-en-gros-plan-d-un-chat-endormi-mignon-416160/",
"https://www.pexels.com/fr-fr/photo/chaton-en-fourrure-grise-127028/",
"https://www.pexels.com/fr-fr/photo/gros-plan-de-la-photographie-de-chaton-brun-et-blanc-1870376/",
 "https://www.pexels.com/fr-fr/photo/photo-en-gros-plan-de-personne-tenant-un-chaton-blanc-1444321/",
 "https://www.pexels.com/fr-fr/photo/chat-tigre-orange-allonge-sur-le-sol-290164/",
 "https://www.pexels.com/fr-fr/photo/chaton-gris-et-blanc-sur-lit-blanc-2061057/",
 "https://www.pexels.com/fr-fr/photo/chaton-noir-et-blanc-sur-textile-marron-96938/",
"https://www.pexels.com/fr-fr/photo/low-angle-view-of-cat-sur-l-arbre-257532/",
"https://www.pexels.com/fr-fr/photo/chaton-bleu-russe-sur-panier-tisse-marron-127027/",
"https://www.pexels.com/fr-fr/photo/photographie-en-gros-plan-de-chat-tigre-endormi-1056251/",
"https://www.pexels.com/fr-fr/photo/photographie-en-gros-plan-d-un-chat-blanc-en-plus-des-lumieres-de-noel-735423/",
"https://www.pexels.com/fr-fr/photo/chaton-blanc-et-gris-sentant-la-fleur-de-marguerite-blanche-1472999/",
"https://www.pexels.com/fr-fr/photo/photo-de-chaton-tigre-gris-et-blanc-assis-sur-un-canape-2194261/",
"https://www.pexels.com/fr-fr/photo/photo-de-chaton-tigre-gris-couche-2558605/",
"https://www.pexels.com/fr-fr/photo/chatons-de-couleurs-assorties-45170/",
"https://www.pexels.com/fr-fr/photo/photo-en-gros-plan-d-une-personne-qui-nourrit-un-chaton-1981111/",
"https://www.pexels.com/fr-fr/photo/chaton-blanc-et-noir-allonge-sur-des-carreaux-479009/",
"https://www.pexels.com/fr-fr/photo/chat-tigre-gris-allonge-sur-des-guirlandes-blanches-923360/",
"https://www.pexels.com/fr-fr/photo/gros-plan-de-la-photographie-de-chaton-blanc-171227/",
"https://www.pexels.com/fr-fr/photo/chat-calico-sur-focus-photo-1404819/"
]
20.times do
Item.create!(
    title: "chaton - "+Faker::Emotion.adjective,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: Faker::Commerce.price(range: 0..100.0, as_string: true),
    image_url: kittens_url.sample
  )
end
puts "✅ Kittens ajoutés."
