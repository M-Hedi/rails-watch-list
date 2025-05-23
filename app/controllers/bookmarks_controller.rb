class BookmarksController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  # No need for app/views/restaurants/destroy.html.erb
    redirect_to @bookmark.list
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    @bookmark.save
    redirect_to list_path(@list)
# if @bookmark.save!

  end
end

private

def bookmark_params
  params.require(:bookmark).permit(:comment, :movie_id)
end
