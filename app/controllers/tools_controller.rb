class ToolsController < ApplicationController
  before_action :set_tool, only: [:show, :create]

  def index
    if params[:tool].nil?
      @tools = Tool.all
    else
      @tools = Tool.all.select { |tool| tool.category == params[:tool][:category] }
      @tools = Tool.all if @tools.empty?
    end
    @tool = Tool.new
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
