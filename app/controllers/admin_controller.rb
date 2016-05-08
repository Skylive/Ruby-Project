class AdminController < ApplicationController
  
  def login
    
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

  def index
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

  def loan
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
  
  def assign
    @b = Book.find(params[:book][:id])
    @m = Member.find(params[:member][:id])
    
    #Restrict accesss
    if current_member.nil?
      redirect_to login_path, notice: "You cannot access here before log in. #notlogin"
    else
      #si on essaye d'accéder à une page alors qu'on est pas admin
       if current_member.isadmin == false || current_member.isadmin.nil?
        redirect_to current_member, notice: "You can only access to your account details #notadmin"
      end
    end
    
    if @b.member_id == @m.id #Renew Loan
      if @b.max_end_date && (@b.max_end_date > DateTime.now)
        if @b.max_end_date > @b.end_date + 30.days
          @b.end_date = @b.end_date + 30.days
        else
          @b.end_date = @b.max_end_date
        end
      end
    else #New Loan
      @b.member_id = @m.id
      @b.end_date = DateTime.now + 30.days
      @b.max_end_date = DateTime.now + 90.days
    end
    @b.save
    flash[:success] = "The book '#{@b.title}' is now assigned to '#{@m.full_name}'"
    redirect_to admin_index_url
  end
  
  def returned
    @b = Book.find(params[:book][:id])
    
    @b.last_member_id = @b.member_id
    @b.member_id = 0
    @b.end_date = nil
    @b.max_end_date = nil
    @b.last_loan_date = DateTime.now
    @b.save
    flash[:success] = "The book '#{@b.title}' is now available again"
    redirect_to admin_index_url
  end
  
end
