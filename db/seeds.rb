# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Booking.destroy_all
Tool.destroy_all
User.destroy_all
# Users for development

User.create(email: "geraldine@gmail.com", password: "1111")
User.create(email: "theo@gmail.com", password: "2222")
User.create(email: "joaquin@gmail.com", password: "3333")

#Tools for development

Tool.create(name: "Perceuse B&D",
  description: "Perceuse Black & Decker sans fil",
  category: Tool::CATEGORIES[1],
  user: User.first,
  address: "6 rue du Repos 69007 LYON",
  brand: "Black & Decker",
  rating: 4,
  condition: Tool::CONDITION[0])
Tool.create(name: "Ponceuse multifunction",
  description: "Ponceuse delta multifonction 130W",
  category: Tool::CATEGORIES[0],
  user: User.first,
  address: "51 rue Anatole France 69100 VILLEURBANNE",
  brand: "Bosch",
  rating: 5,
  condition: Tool::CONDITION[1])
Tool.create(name: "Scie circulaire",
  description: "Scie circulaire plongeante MAKITA SP6000J1 - 1300W - 165MM",
  category: Tool::CATEGORIES[3],
  user: User.last,
  address: "1 Rue Justin Godart, 69004 Lyon",
  brand: "Makita",
  rating: 3,
  condition: Tool::CONDITION[2])
Tool.create(name: "Visseuse à choc",
  description: "Lot outils MAKITA LCT204J (Perceuse Visseuse DF330D - Visseuse à Choc TD090D",
  category: Tool::CATEGORIES[2],
  user: User.last,
  address: "1 Rue Justin Godart, 69004 Lyon",
  brand: "Makita",
  rating: 4,
  condition: Tool::CONDITION[0])
Tool.create(name: "Kit de presse",
  description: "Ensemble D'Outils De Roulement De Vélo Outil D'Installation D'Outils De Montage De Moyeu",
  category: Tool::CATEGORIES[5],
  user: User.last,
  address: "1 Rue Justin Godart, 69004 Lyon",
  brand: "Inconnu",
  rating: 2,
  condition: Tool::CONDITION[2])

# Bookings for development

Booking.create(status: Booking::STATUS[0], user: User.last, tool: Tool.first, start_date: Date.today + 1, end_date: Date.today + 2)
Booking.create(status: Booking::STATUS[1], user: User.first, tool: Tool.last, start_date: Date.today + 3, end_date: Date.today + 4)
