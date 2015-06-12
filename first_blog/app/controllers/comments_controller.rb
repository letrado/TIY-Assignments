class CommentsController < ApplicationController

	def index

		
	end


	def new 
		@comment = Comment.new
		@post = Post.find(params[:post_id])
	end

	def edit
		
	end

	def show

	end



	def create 
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(params[:comment].permit(:author, :content))

		redirect_to posts_path(@post)
	end

end
