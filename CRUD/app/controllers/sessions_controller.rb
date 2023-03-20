class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:identifier].present? && params[:password].present?
      user = User.find_by(identifier: params[:identifier])
      if user
        if user.authenticate(params[:password])
          session[:user_id] = user.id
          flash[:notice] = "로그인 성공"
          redirect_to root_path
          return
        else
          	flash[:notice] = "잘못된 비밀번호 입니다. 다시 확인해주세요."
        	redirect_to sessions_sign_in_path
		end
      else
        flash[:notice] = "잘못된 아이디입니다. 다시 확인해주세요."
      	redirect_to sessions_sign_in_path
	  end
    else
      	flash[:notice] = "아이디, 비밀번호 모두 입력해주세요"
    	redirect_to sessions_sign_in_path
	end
  end

  def destroy
    if current_user.present?
      reset_session
      flash[:notice] = "로그아웃 성공"
      redirect_to root_path
    end
  end
	
end
