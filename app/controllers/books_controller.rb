# frozen_string_literal: true

class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
    @comments = @book.comments.all
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to @book, notice: t("flash.create", obj: Book.model_name.human)
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: t("flash.update", obj: @book.title)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: t("flash.destroy", obj: @book.title)
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :memo, :author, :picture)
    end
end
