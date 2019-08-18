class BooksController < ApplicationController

  def edit
    @book = Book.find(params[:id])
    if @book.save
      flash[:notice] = "successfully"
    else
       render :new
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @book = Book.new
    @books = Book.all.order(created_at: :desc)
  end

  def new
  end

  def create
    book = Book.new(book_params)
      if book.save
        redirect_to book_path(book.id), notice: 'successfully'
      else
        render :new
      end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end