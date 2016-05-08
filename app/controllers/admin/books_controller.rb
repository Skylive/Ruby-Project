class Admin::BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.all
    
    #Restrict accesss
    if current_member.nil?
      redirect_to login_path, notice: "You cannot access here before log in. #notlogin"
    else
      #si on essaye d'accéder à une page alors qu'on est pas admin
       if current_member.isadmin == false || current_member.isadmin.nil?
        redirect_to current_member, notice: "You can only access to your account details #notadmin"
      end
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    #Restrict accesss
    if current_member.nil?
      redirect_to login_path, notice: "You cannot access here before log in. #notlogin"
    else
      #si on essaye d'accéder à une page alors qu'on est pas admin
       if current_member.isadmin == false || current_member.isadmin.nil?
        redirect_to current_member, notice: "You can only access to your account details #notadmin"
      end
    end
  end

  # GET /books/new
  def new
    @book = Book.new
    #Restrict accesss
    if current_member.nil?
      redirect_to login_path, notice: "You cannot access here before log in. #notlogin"
    else
      #si on essaye d'accéder à une page alors qu'on est pas admin
       if current_member.isadmin == false || current_member.isadmin.nil?
        redirect_to current_member, notice: "You can only access to your account details #notadmin"
      end
    end
  end

  # GET /books/1/edit
  def edit
    #Restrict accesss
    if current_member.nil?
      redirect_to login_path, notice: "You cannot access here before log in. #notlogin"
    else
      #si on essaye d'accéder à une page alors qu'on est pas admin
       if current_member.isadmin == false || current_member.isadmin.nil?
        redirect_to current_member, notice: "You can only access to your account details #notadmin"
      end
    end
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    
    #Restrict accesss
    if current_member.nil?
      redirect_to login_path, notice: "You cannot access here before log in. #notlogin"
    else
      #si on essaye d'accéder à une page alors qu'on est pas admin
       if current_member.isadmin == false || current_member.isadmin.nil?
        redirect_to current_member, notice: "You can only access to your account details #notadmin"
      end
    end

    respond_to do |format|
      if @book.save
        format.html { redirect_to admin_books_url, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    
    #Restrict accesss
    if current_member.nil?
      redirect_to login_path, notice: "You cannot access here before log in. #notlogin"
    else
      #si on essaye d'accéder à une page alors qu'on est pas admin
       if current_member.isadmin == false || current_member.isadmin.nil?
        redirect_to current_member, notice: "You can only access to your account details #notadmin"
      end
    end
    
    
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to admin_books_url, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    
    #Restrict accesss
    if current_member.nil?
      redirect_to login_path, notice: "You cannot access here before log in. #notlogin"
    else
      #si on essaye d'accéder à une page alors qu'on est pas admin
       if current_member.isadmin == false || current_member.isadmin.nil?
        redirect_to current_member, notice: "You can only access to your account details #notadmin"
      end
    end
    
    if !@book.isactivebook
      @book.destroy
      respond_to do |format|
        format.html { redirect_to admin_books_url, notice: 'Book was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_books_url, notice: 'This book is still active, cannot be destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:title, :isbn, :description, :author, :image, :member_id, :end_date, :max_end_date, :last_member_id, :last_loan_date, :isactivebook, :reason)
    end
end
