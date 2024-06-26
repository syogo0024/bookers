class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    #@book = Book.index(book_params)
    if @book.save
      flash[:notice] = "Book was successfully cerated"
      redirect_to book_path(@book.id)
    else
      #flash.now[:alert] = "投稿に失敗しました。" #キーをalertに変更
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if  @book.update(book_params)
        redirect_to book_path(@book.id)
        flash[:notice] = "Book was successfully cerated"
    else
      #flash.now[:alert] = "投稿に失敗しました。" #キーをalertに変更
      #@books = Book.all
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
