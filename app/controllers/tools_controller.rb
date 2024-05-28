class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :create]

  def index
    @tools = Tool.all
    @booking = Booking.new
  end

  def show
    @booking = Booking.new
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def tool_params

  end

  def set_tool
    @tool = Tool.find(params[:id])
  end
end
