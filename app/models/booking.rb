class Booking < ApplicationRecord
  STATUS = ["pending", "accepted", "refused"]
  belongs_to :user
  belongs_to :tool
  validates :start_date, :end_date, overlap: { scope: 'tool_id', message_content: 'Tool already booked' }
  validates :status, inclusion: { in: STATUS }
end
