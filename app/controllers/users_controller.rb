class UsersController < ApplicationController
  def index

  	@users = User.all

  end

  def new
 
  		@errors = flash[:errors]	
 
  end

  def create
     @newUser = User.new(first_name:params[:fristName],last_name:params["lastName"],email_address:params["emailAddress"],password:params[:password])
    if(@newUser.save)
    	redirect_to('/')
    else
    	flash[:errors] = @newUser.errors.full_messages
    	redirect_to('/users/new')
    	
    end
  end

  def show
  	@oneUser = User.find_by(id:params[:id])
  	end

  def edit
  
  	@currentUser = User.find_by(id:params[:id])

  end

  def destroy
  	User.find_by(id:params[:id]).destroy
  	redirect_to('/')
  end

  def update
   	@updatedUser = User.find_by(id:params[:id])
   	puts @updatedUser
   	if @updatedUser.update(first_name:params[:fristName],last_name:params["lastName"],email_address:params["emailAddress"],password:params[:password])
   		redirect_to('/')
   	end
   end
   	# .update(first_name:params[:firstName])
  		# , last_name:params["lastName"], email_address:params['emailAddress'], password:params[:password]

end
