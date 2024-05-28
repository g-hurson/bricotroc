class BookingsController < ApplicationController
  before_action :set_booking, only: #[à définir]

  def new
  end

  def show
  end

  def index
  end

  def create
  end

  private

  def booking_params
  end

  def set_booking
    @booking = Booking.new
  end
end
