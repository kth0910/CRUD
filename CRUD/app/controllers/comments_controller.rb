class CommentsController < ApplicationController
	
	def post
		@user = User.find_by(identifier: params[:identifier])
		current_user = @user
	end
	
	
	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.new
		@comment.nickname = params[:nickname]
		@comment.content = params[:content]
		@comment.post_id = params[:post_id]
		@comment.save
		redirect_to '/post/'+params[:post_id]
	end

	
	def edit
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:comment_id])
	end
	
	
	def update
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:comment_id])
		@comment.content = params[:content]
		@comment.save
		redirect_to '/post/'+params[:post_id]
	end
	
	
	def delete
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:comment_id])
		@comment.destroy
		redirect_to '/post/'+params[:post_id]
	end

end
