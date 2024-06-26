# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require "open-uri"

cloudinary_path = "https://collection.cloudinary.com/dk5jeli9u/"
# https://collection.cloudinary.com/dk5jeli9u/57bd50b0ef9cdc3235567bc314699065

Booking.destroy_all
Tool.destroy_all
User.destroy_all
# Users for development

geraldine = User.new(email: "geraldine@gmail.com", password: "1111")
geraldine.avatar.attach(io: File.open(Rails.root.join("app/assets/images/geraldine.jpeg")), filename: "geraldine.jpeg", content_type: "image/jpeg")
geraldine.save

theo = User.new(email: "theo@gmail.com", password: "2222")
theo.avatar.attach(io: File.open(Rails.root.join("app/assets/images/theo.jpeg")), filename: "theo.jpeg", content_type: "image/jpeg")
theo.save

joaquin = User.new(email: "joaquin@gmail.com", password: "3333")
joaquin.avatar.attach(io: File.open(Rails.root.join("app/assets/images/joaquin.jpeg")), filename: "joaquin.jpeg", content_type: "image/jpeg")
joaquin.save

#Tools for development
tool = Tool.new(name: "Perceuse sans fil",
  description: "Je mets à disposition ma perceuse-visseuse sans fil avec ses accessoires (forets bois, forets acier, embouts vissage, batterie et chargeur).
  Idéal pour effectuer vos travaux de bricolage quotidien à un prix réduit. Possibilité de prendre en même temps les têtes ponceuse/grattoir/scie sabre bois ou métal.
  Au plaisir de vous dépanner, Dorine",
  category: Tool::CATEGORIES[1],
  user: User.first,
  address: "6 rue du Repos 69007 Lyon",
  brand: "Parkside",
  rating: 5,
  condition: Tool::CONDITION[1])

# Test uploading images from cloudinary
# tool.photos.attach(io: URI.open("https://res.cloudinary.com/dk5jeli9u/image/upload/v1717198978/bricotroc/perceuse1.jpg"), filename: "perceuse1.jpg", content_type: "image/jpg")

photos_perceuse = ["perceuse4.jpg", "perceuse5.jpg", "perceuse6.jpg"]
photos_perceuse.each do |photo|
  tool.photos.attach(io: File.open(Rails.root.join("app/assets/images/#{photo}")), filename: photo, content_type: "image/jpg")
end
tool.save

tool = Tool.new(name: "Perceuse B&D",
  description: "BLACK+DECKER BDCDD12-QW Perceuse-visseuse sans fil - Chargeur inclus, 10.8V, Sans coffret, 1 batterie",
  category: Tool::CATEGORIES[1],
  user: User.first,
  address: "35 Rue du Sillon, 69360 Communay",
  brand: "Black & Decker",
  rating: 2,
  condition: Tool::CONDITION[1])

photos_perceuse = ["perceuse1.jpg", "perceuse2.jpg", "perceuse3.jpg"]
photos_perceuse.each do |photo|
  tool.photos.attach(io: File.open(Rails.root.join("app/assets/images/#{photo}")), filename: photo, content_type: "image/jpg")
end
tool.save

tool = Tool.new(name: "Ponceuse multifunction",
  description: "Ponceuse delta multifonction 130W",
  category: Tool::CATEGORIES[0],
  user: User.first,
  address: "51 rue Anatole France 69100 VILLEURBANNE",
  brand: "Delta",
  rating: 5,
  condition: Tool::CONDITION[1])

photos_ponceuse = ["ponceuse1.jpg", "ponceuse2.jpg", "ponceuse3.jpg"]
photos_ponceuse.each do |photo|
  tool.photos.attach(io: File.open(Rails.root.join("app/assets/images/#{photo}")), filename: photo, content_type: "image/jpg")
end
tool.save

tool = Tool.new(name: "Scie manuelle",
  description: "Scie égoïne à bois universelle 500 mm Sharpcut - STANLEY - STHT20367-1",
  category: Tool::CATEGORIES[3],
  user: User.last,
  address: "1 Rue Justin Godart, 69004 Lyon",
  brand: "Stanley",
  rating: 3,
  condition: Tool::CONDITION[2])

photos_scie = ["scie1.jpeg", "scie2.jpeg", "scie3.jpeg"]
photos_scie.each do |photo|
  tool.photos.attach(io: File.open(Rails.root.join("app/assets/images/#{photo}")), filename: photo, content_type: "image/jpeg")
end
tool.save

tool = Tool.new(name: "Visseuse à choc",
  description: "DEWALT - Boulonneuse à Chocs 1/2' Brushless XR 18V 5Ah Li-ion - DCF899P2-QW - Visseuse à Choc sans Fil avec Coffret TSTAK, Chargeur, 2 Batteries 5 Ah",
  category: Tool::CATEGORIES[2],
  user: User.last,
  address: "1 Rue Justin Godart, 69004 Lyon",
  brand: "Dewalt",
  rating: 4,
  condition: Tool::CONDITION[0])

photos_visseuse = ["visseuse1.jpg", "visseuse2.jpg", "visseuse3.jpg"]
photos_visseuse.each do |photo|
  tool.photos.attach(io: File.open(Rails.root.join("app/assets/images/#{photo}")), filename: photo, content_type: "image/jpg")
end
tool.save

tool = Tool.new(name: "Kit de pressage",
  description: "Wanocean Kit de pressage pour roulement de cycle, kit de pressage de roulement de vélo, outil de montage de moyeu de VTT, outil d'installation",
  category: Tool::CATEGORIES[5],
  user: User.last,
  address: "1 Rue Justin Godart, 69004 Lyon",
  brand: "Wanocean",
  rating: 2,
  condition: Tool::CONDITION[2])

photos_kit = ["kit1.jpg", "kit2.jpg", "kit3.jpg", "kit4.jpg"]
photos_kit.each do |photo|
  tool.photos.attach(io: File.open(Rails.root.join("app/assets/images/#{photo}")), filename: photo, content_type: "image/jpg")
end
tool.save

# Bookings for development

Booking.create(status: Booking::STATUS[0], user: User.last, tool: Tool.first, start_date: Date.today + 1, end_date: Date.today + 2)
Booking.create(status: Booking::STATUS[1], user: User.first, tool: Tool.last, start_date: Date.today + 3, end_date: Date.today + 4)
