class BooksController < ApplicationController

  # def new
  #   @book = Book.new
  # end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book), notice: 'Book was successfully created.'
    else
      # @user = current_user
      @books = Book.all
      # @book = Book.new
       render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
    # @books = Book.page(params[:page]).reverse_order
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book = Book.new
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    # @books = Book.all
    @book = Book.find(params[:id])
    if @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
    else
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
