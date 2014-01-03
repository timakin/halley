class CommentsController < ApplicationController
	def create
		@commentable = Comment.find_commentable(params[:comment][:commentable_type],
			params[:comment][:commentable_id])
			if @commentable
				  @comment = @commentable.comments.create(comment_params) if !comment_params[:comment].blank? 
				if @comment.nil?
					redirect_to databox_path(params[:comment][:commentable_id])		
				elsif @comment.save	
					render json: { post: @comment }
				#	redirect_to databoxes_path
				end				
			else
				redirect_to root_url
			end		
	end

	private

	def comment_params
		params.require(:comment).permit(:comment)	
	end
end
