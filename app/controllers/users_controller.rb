class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    # @user = User.page(books_params[:page]).reverse_order
    @books = @user.books
    # @user = Kaminari.paginate_array(Book.find_all_by_book_id(params[:id])).page(params[:page]).per(5)
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id), notice: 'User was successfully updated.'
    else
       render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  # def user_params_update
  #   params.require(:user).permit(:name, :profile_image, :introduction)
  # end
end
