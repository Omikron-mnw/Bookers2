class UsersController < ApplicationController #User::ApplicationController?
  before_action :ensure_correct_user,only: [:edit, :update]
  # before_action :set_user

  def show
    @new_book = Book.new
    @user = User.find(params[:id])
    # @user = User.page(books_params[:page]).reverse_order
    @books = @user.books
    @book = Book.find(params[:id])
    # @user = Kaminari.paginate_array(Book.find_all_by_book_id(params[:id])).page(params[:page]).per(5)
  end

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
    # @users = User.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
    # if @user.id == current_user.id
    #   redirect_to edit_user_path(@user.id)
    # else
    #   redirect_to action: :show,id:current_user.id
    # end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to user_path(@user.id), notice: 'User was successfully updated.'
    else
       render :edit
    end
  end

  #binding.pry <--ターミナルの処理を止めたいところに入れる

  def search
    @user_or_book = params[:option]
    @how_search = params[:choice]
    if @user_or_book == "1"
      @users = User.search(params[:search], @user_or_book, @how_search)
    else
      @books = Book.search(params[:search], @user_or_book, @how_search)
    end
  end

  def ensure_correct_user
    @user = User.find_by(id:params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end


  # def create
  #   if @user.save
  #     NotificationMailer.send_confirm_to_user(@user).delivery
  #     redirect_to @user
  #   else
  #     render 'new'　　　　　　　　　　　＃うまくいかなかった
  #   end
  # end


  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction) #, :postcode, :prefecture_code, :address_city, :address_street, :address_building
  end

  # def user_params_update
  #   params.require(:user).permit(:name, :profile_image, :introduction)
  # end
end
