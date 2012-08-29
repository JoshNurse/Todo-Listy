class UsersController < ApplicationController
  
  # GET /users
  def index
    @users = User.count

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /users/1
  def show
    @user = current_user

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /users/new
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /users/1/edit
  def edit
    @user = current_user
  end

  # POST /users
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to lists_path, notice: 'Your account has been successfully created!' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /users/1
  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Your account has been updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user = current_user
    @user.destroy

    respond_to do |format|
      format.html {
        redirect_to root_path,
        notice: "We're sorry to see you go :("
      }
    end
  end
end
