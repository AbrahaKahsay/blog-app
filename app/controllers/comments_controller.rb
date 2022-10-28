class CommentsController < ApplicationController
    def index
    end

    def new
        @comment= Comment.new
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.new(comment_params)
        if @comment.save
          flash[:success] = "Comment successfully created"
          redirect_to user_post_comments_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    private

    def comment_params
        params.require(:comment).permit(:user_id, :post_id, :text)
    end
    end
end
