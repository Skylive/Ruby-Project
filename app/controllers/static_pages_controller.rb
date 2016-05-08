class StaticPagesController < ApplicationController
  def home
    @books = Book.all
  end

  def about
  end

  def contact
  end
end
