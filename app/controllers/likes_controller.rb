class LikesController < ApplicationController
    def create
        @like = Like.new(params[:like])
        if @like.save
          flash[:success] = "Liked"
          redirect_to new_user_post_comment_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end 
end
