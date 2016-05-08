class MemberController < ApplicationController
  
  def index
    @books = Book.all
    
    #Restrict accesss
    if current_member.nil?
      redirect_to login_path, notice: "You cannot access here before log in."
    end
  end
  
  def show
    @books = Book.all
    
    #Restrict accesss
    if current_member.nil?
      redirect_to login_path, notice: "You cannot access here before log in."
    else
      #si on essaye d'accéder à une page qui nexiste pas
      if Member.exists?(params[:id])
        @member = Member.find(params[:id])
        
          #si on essaye d'accéder à une page qui n'est pas la notre
           if @member.id != current_member.id
            redirect_to current_member, notice: "You can only access to your account details"
           end
      else
        @member = nil
        redirect_to current_member, notice: "You can only access to your account details #"
      end
    end
  end
  
  def renew
    @b = Book.find(params[:id])
    
    if @b.member_id == current_member.id #Renew Book
      if @b.max_end_date && (@b.max_end_date > DateTime.now)
        if @b.max_end_date > @b.end_date + 30.days
          @b.end_date = @b.end_date + 30.days
        else
          if @b.end_date == @b.max_end_date
            flash[:danger] = "You can't renew, you have reached your limit (90 days) for this book"
            redirect_to current_member
            return
          else
            @b.end_date = @b.max_end_date
          end
        end
      end
    end
    @b.save
    flash[:success] = "Book renewed !"
    redirect_to current_member
  end
  
  def new
    @member = Member.new
    
    #Restrict accesss
    if current_member.blank?
      redirect_to login_path, notice: "You cannot access here before log in."
    end
  end

  def create
    @member = Member.new(user_params)
    
    #Restrict accesss
    if current_member.blank?
      redirect_to login_path, notice: "You cannot access here before log in."
    end
    
    if @member.save
      log_in @member
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @member
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:member).permit(:login, :password, :firstname, :lastname, :address1, :address2, :phoneno, :isactivemember)
    end
  
end
