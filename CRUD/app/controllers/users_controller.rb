class UsersController < ApplicationController
	
	before_action :user_params, only: [:create]
	
	
	def new
		@user = User.new
	end

	
	def create
		@user = User.new(user_params)
#		@user.nickname = params[:nickname]
#		@user.identifier = params[:identifier]
#		@user.password = params[:password_digest]
		
		if @user.save
			
			flash[:notice] = "계정이 성공적으로 생성되었습니다!"
			redirect_to root_path
		else
			
			flash[:notice] = "계정을 생성할 수 없습니다. 사용 가능한 아이디와 비밀번호를 사용했는지 다시 한 번 확인해 주세요."
			redirect_to users_new_path
		end
	end
		
	private
	def user_params
		params.require(:user).permit(:nickname, :identifier, :password, :password_confirmation)
	end
end
