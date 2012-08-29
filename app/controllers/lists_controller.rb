class ListsController < ApplicationController
  before_filter :require_user
  
  # GET /lists
  def index
    @lists = current_user.lists.find(:all, :order => 'updated_at DESC')
  end

  # GET /lists/1
  def show
    @list = current_user.lists.find(params[:id])
    @items = @list.list_items
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
    @list = current_user.lists.find(params[:id])
  end

  # POST /lists
  def create
    @user = User.find(current_user.id)
    @list = @user.lists.create(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /lists/1
  def update
    @list = current_user.lists.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /lists/1
  def destroy
    @list = current_user.lists.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url }
    end
  end
end
