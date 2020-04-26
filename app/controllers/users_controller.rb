class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  	@user = User.find_by_id(params[:id])
  end

  def edit
    @user = User.find_by_id(params[:id])
  end

	def update
		# Find User
		@user = User.find_by_id(params[:id])
		# Update User
	 	if @user.update(user_params.merge(gender: params[:gender].downcase)) 
	 		redirect_to user_path(@user)
	 	else
	 		render 'edit'
	  end
	end

	private

	  def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :age, :gender, :phone_number, :address)
    end
end
