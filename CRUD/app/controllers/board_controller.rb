class BoardController < ApplicationController
	
	
	def index
		@posts = Post.all
		@user = User.find_by(identifier: params[:identifier])
		current_user = @user
	end
	
	def create
		nickname = params[:nickname]
		title = params[:title]
		content = params[:content]
		Post.create(nickname: nickname, title: title, content: content)
		redirect_to '/board'
	end
	
	def edit
		@post = Post.find(params[:id])
	end
	
	def update
		@post = Post.find(params[:id])
		@post.title = params[:title]
		@post.content = params[:content]
		@post.save
		redirect_to '/board'
	end
	
	def delete
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to '/board'
	end
	
	
	def post
		@post = Post.find(params[:id])
		@user = User.find_by(identifier: params[:identifier])
		current_user = @user
		@comments = @post.comments.all
	end
	
		
end
