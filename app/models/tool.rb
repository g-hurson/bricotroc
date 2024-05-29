class Tool < ApplicationRecord
  CATEGORIES = ["ponceuse", "perceuse", "visseuse", "scie", "multifonction", "divers"]
  belongs_to :user
  has_many :bookings
  has_many_attached :photos
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
