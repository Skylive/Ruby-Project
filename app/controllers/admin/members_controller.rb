class Admin::MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
    
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

  # GET /members/1
  # GET /members/1.json
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

  # GET /members/new
  def new
    @member = Member.new
    
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

  # GET /members/1/edit
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

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    
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
      if @member.save
        format.html { redirect_to admin_members_url, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
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
      if @member.update(member_params)
        format.html { redirect_to admin_members_url, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
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
    
    if !@member.isactivemember
      @member.destroy
      respond_to do |format|
        format.html { redirect_to admin_members_url, notice: 'Member was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to admin_books_url, notice: 'This member is still active, cannot be destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:login, :password, :firstname, :lastname, :address1, :address2, :phoneno, :isactivemember, :isadmin)
    end
end
