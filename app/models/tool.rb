class Tool < ApplicationRecord
  CATEGORIES = ["Ponceuse", "Perceuse", "Visseuse", "Scie", "Multifonction", "Divers"]
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
