class ParentController < ApplicationController
  def login
    parent = Parent.find_by(email: parent_params['email'])
    if parent && parent.authenticate(parent_params['password'])
      session[:user_id] = parent.id
      redirect_to '/dashboard'
    else
      redirect_to '/'
    end
  end
  
  def create
    
  end
  
  def store
    @parent = Parent.new(parent_params)
    @parent.save
    redirect_to '/'
  end
  
  private
    def parent_params
      params.require(:parent).permit(:name, :email, :password, :password_confirmation)
    end
end

