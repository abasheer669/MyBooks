class Api::V1::BooksController < ApplicationController
    before_action :set_book, only: %i[ show update destroy ]

    def index
        #@books = Book.all
        @books = Book.where(user_id: params[:user_id])
        render json: @books, status: :ok, each_serializer: Api::V1::BookSerializer
        #render json: {status: 'SUCCESS', message: 'Loaded books', data:@books}, status: :ok
    end

    def show
        render json: @book, status: :ok, serializer: Api::V1::BookSerializer

    end

    def create
        @book = Book.new(book_params.merge(user_id: params[:user_id]))
        # @book.user_id = params[:user_id]
        if @book.save 
            render json: {status: 'SUCCESS'}
            #render json: @book
        else
            render json: {status: 'Error'}
        end
    end

    def destroy
        @book.destroy
        render json: {status: 'SUCCESS'}
    end

    def update

        if @book.update(book_update_params)
            render json: {status: 'SUCCESS'}
        else
            render json: {status: 'Error'}
        end
    end

    private

    def book_params
        params.require(:book).permit(:title, :price, :body, :genre, :isbn, :author)

    end

    def book_update_params
        params.require(:book).permit(:title, :price, :body, :genre, :isbn, :author, :user_id)
    end

    def set_book
        @book = Book.find(params[:id])
    end

end
