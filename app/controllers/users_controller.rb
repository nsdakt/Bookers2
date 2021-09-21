class UsersController < ApplicationController

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
    @user = User.find(params[:id])
  end

  def update
    @user = current_user.id
    @user.update
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :introduction)
  end

end