class Tool < ApplicationRecord
  CATEGORIES = ["Ponceuse", "Perceuse", "Visseuse", "Scie", "Multifonction", "Divers"]
  CONDITION = ["Neuf", "Bon état", "Usé"]
  belongs_to :user
  has_many :bookings
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :address, presence: true
  validates :name, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
end
