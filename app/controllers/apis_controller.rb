class ApisController < ApplicationController
  before_action :authorize

  # GET /post-like/post_id
  def like_post
    @post_id = params[:post_id];
    @post_like = @user.post_likes.find_by(post_id: @post_id)

    #if user has liked post b4
    if@post_like
        @post_like.title = 'like'
        @post_like.post_id = @post_id
        @post_like.user_id = @user.id
        @post_like.save
        @response = {
            :status => 200,
            :message => "Post Updated Liked Successfully",
            :post_like => @post_like ? 'true' : 'false'
        }
    else
        @post_like = PostLike.new
        @post_like.title = 'like'
        @post_like.post_id = @post_id
        @post_like.user_id = @user.id
        @post_like.save
        @response = {
            :status => 200,
            :message => "Post Liked Successfully",
            :post_like => @post_like ? 'true' : 'false'
        }
    end
    render json: @response

  end

  # GET /post-unlike/post_id
  def unlike_post
    
    @post_like = PostLike.new
    @post_like.title = 'like'
    @post_like.post_id = params[:post_id]
    @post_like.user_id = @user.id
    @post_like.save
    @response = {
        :status => 200,
        :message => "Post Liked Successfully",
        :post_like => @post_like
    }
    render json: @response
    
  end


end
