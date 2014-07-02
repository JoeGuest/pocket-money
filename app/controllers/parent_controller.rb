class ParentController < ApplicationController
  skip_before_action :require_login
  
  def login
    parent = Parent.find_by(email: parent_params['email'])
    if parent && parent.authenticate(parent_params['password'])
      session[:user_id] = parent.id
      redirect_to '/dashboard'
    else
      redirect_to '/', alert: 'invalid email or password'
    end
  end
  
  def create
    
  end
  
  def store
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to '/', alert: "You have registered, please login below."
    else
      render 'create'
    end
  end
  
  private
    def parent_params
      params.require(:parent).permit(:name, :email, :password, :password_confirmation)
    end
end

