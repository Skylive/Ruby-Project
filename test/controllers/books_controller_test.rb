require 'test_helper'

class AdminControllerTest::BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { author: @book.author, end_date: @book.end_date, description: @book.description, image: @book.image, isactivebook: @book.isactivebook, isbn: @book.isbn, last_loan_date: @book.last_loan_date, last_member_id: @book.last_member_id, max_end_date: @book.max_end_date, member_id: @book.member_id, title: @book.title }
    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    patch :update, id: @book, book: { author: @book.author, end_date: @book.end_date, description: @book.description, image: @book.image, isactivebook: @book.isactivebook, isbn: @book.isbn, last_loan_date: @book.last_loan_date, last_member_id: @book.last_member_id, max_end_date: @book.max_end_date, member_id: @book.member_id, title: @book.title }
    assert_redirected_to book_path(assigns(:book))
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end
