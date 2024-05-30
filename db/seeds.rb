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

# Photo upload to Cloudinary



#Tools for development

# tool = Tool.new(name: "Perceuse B&D", description: "Perceuse Black & Decker sans fil", category: Tool::CATEGORIES[1], user: User.first)
# photos_perceuse = ["perceuse1.jpg", "perceuse2.jpg", "perceuse3.jpg"]
# photos_perceuse.each do |photo|
#  tool.photos.attach(io: File.open(Rails.root.join("app/assets/images/#{photos_perceuse.shift}")), filename: photo, content_type: "image/jpg")
# end
# tool.save

# tool = Tool.new(name: "Ponceuse multifunction", description: "Ponceuse delta multifonction 130W", category: Tool::CATEGORIES[0], user: User.first)
# photos_ponceuse = ["perceuse1.jpg", "perceuse2.jpg", "perceuse3.jpg"]
# photos_ponceuse.each do |photo|
#   tool.photos.attach(io: File.open(Rails.root.join("app/assets/images/#{photos_ponceuse.shift}")), filename: photo, content_type: "image/jpg")
# end
# tool.save

tool = Tool.new(name: "Scie à bois", description: "Scie Jetcut™ STANLEY, coupe grossière, L 380 mm", category: Tool::CATEGORIES[3], user: User.last)
photos_scie = ["scie1.jpeg", "scie2.jpeg", "scie3.jpeg"]
photos_scie.each do |photo|
  tool.photos.attach(io: File.open(Rails.root.join("app/assets/images/#{photos_scie.shift}")), filename: photo, content_type: "image/jpeg")
end
tool.save

# tool = Tool.new(name: "Visseuse à choc", description: "Lot outils MAKITA LCT204J (Perceuse Visseuse DF330D - Visseuse à Choc TD090D", category: Tool::CATEGORIES[2], user: User.last)
# photos_visseuse = ["perceuse1.jpg", "perceuse2.jpg", "perceuse3.jpg"]
# photos_visseuse.each do |photo|
#   tool.photos.attach(io: File.open(Rails.root.join("app/assets/images/#{photos_visseuse.shift}")), filename: photo, content_type: "image/jpg")
# end
# tool.save

# tool = Tool.new(name: "Kit de presse", description: "Ensemble D'Outils De Roulement De Vélo Outil D'Installation D'Outils De Montage De Moyeu", category: Tool::CATEGORIES[5], user: User.last)
# photos_kit = ["perceuse1.jpg", "perceuse2.jpg", "perceuse3.jpg"]
# photos_kit.each do |photo|
#   tool.photos.attach(io: File.open(Rails.root.join("app/assets/images/#{photos_kit.shift}")), filename: photo, content_type: "image/jpg")
# end
# tool.save

# Bookings for development

Booking.create(status: Booking::STATUS[0], user: User.last, tool: Tool.first, start_date: Date.today + 1, end_date: Date.today + 2)
Booking.create(status: Booking::STATUS[1], user: User.first, tool: Tool.last, start_date: Date.today + 3, end_date: Date.today + 4)
