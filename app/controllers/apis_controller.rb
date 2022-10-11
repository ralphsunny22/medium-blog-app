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
            :post_like => @post_like
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
            :post_like => @post_like
        }
    end
    render json: @response

  end

  # GET /post-unlike/post_id
  def unlike_post
    @post_id = params[:post_id];
    @post_like = @user.post_likes.find_by(post_id: @post_id)

    #if user has liked post b4
    if@post_like
        @post_like.title = 'unlike'
        @post_like.post_id = @post_id
        @post_like.user_id = @user.id
        @post_like.save
        @response = {
            :status => 200,
            :message => "Post Updated Unliked Successfully",
            :post_like => @post_like
        }
    else
        @post_like = PostLike.new
        @post_like.title = 'unlike'
        @post_like.post_id = @post_id
        @post_like.user_id = @user.id
        @post_like.save
        @response = {
            :status => 200,
            :message => "Post unliked Successfully",
            :post_like => @post_like
        }
    end
    render json: @response

  end

  # GET /post-likes-unlikes/post_id
  def post_likes_and_unlikes

    @post_id = params[:post_id];
    @post = Post.find_by(:id => @post_id)
    if@post
        @post_likes_and_unlikes = @post.post_likes.all
        @response = {
            :status => 200,
            :message => "Post Likes and Unlikes",
            :data => @post_likes_and_unlikes
        }
        render json: @response
    else
    @response = {
              :status => 400,
              :message => "Post does not exist",
          }
          render json: @response, status: 400
    end

  end

  def post_likes
    @post_id = params[:post_id];
    @post = Post.find_by(:id => @post_id)
    
    if@post
        @post_likes = @post.post_likes.where(title: "like")
        @response = {
            :status => 200,
            :message => "Post Likes",
            :data => @post_likes
        }
        render json: @response
    else
        @response = {
            :status => 400,
            :message => "Post does not exist",
        }
        render json: @response, status: 400
    end
  end

  def post_unlikes
    @post_id = params[:post_id];
    @post = Post.find_by(:id => @post_id)
    
    if@post
        @post_likes = @post.post_likes.where(title: "unlike")
        @response = {
            :status => 200,
            :message => "Post Unlikes",
            :data => @post_likes
        }
        render json: @response
    else
        @response = {
            :status => 400,
            :message => "Post does not exist",
        }
        render json: @response, status: 400
    end
  end


end
