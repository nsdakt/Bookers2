class UsersController < ApplicationController
   before_action :correct_user, only: [:edit, :update]

   def index
    @users = User.all
    @user = current_user
    @book = Book.new
   end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to user_path(current_user)
   end
  end
end
