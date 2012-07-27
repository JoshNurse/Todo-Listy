class ListItemsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @item = @list.list_items.create(params[:list_item])
    redirect_to list_path(@list)
  end
  
  def destroy
    @list = List.find(params[:list_id])
    @item = @list.list_items.find(params[:id])
    @item.destroy
    redirect_to list_path(@list)
  end
end
