class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  # As a user, I can view the details of a restaurant
  def show
    @list = List.find(params[:id])
    # @bookmark = Bookmark.new
    @review = Review.new(list: @list)
  end

  # As a user, I can add a new restaurant
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end

  def find_list
    @list = List.find(params[:id])
  end
end
