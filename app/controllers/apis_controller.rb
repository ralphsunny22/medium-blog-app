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

  # GET /post-likes/post_id
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

  # GET /post-unlikes/post_id
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

  # GET /user-likes
  def user_likes
    @post_id = params[:post_id];
    @post_likes = @user.post_likes.where(title: "like")
    @response = {
            :status => 200,
            :message => "User Likes",
            :data => @post_likes
        }
        render json: @response
  end

  # GET /user-unlikes/post_id
  def user_unlikes
    @post_id = params[:post_id];
    @post_likes = @user.post_likes.where(title: "unlike")
    @response = {
            :status => 200,
            :message => "User Unlikes",
            :data => @post_likes
        }
    render json: @response
  end

  #GET user-save-post/:post_id
  def user_save_post
    @post_id = params[:post_id];
    @save_post = @user.save_posts.find_by(post_id: @post_id)

    #if user has saved post b4
    if@save_post
        @save_post.title = 'save'
        @save_post.post_id = @post_id
        @save_post.user_id = @user.id
        @save_post.save
        @response = {
            :status => 200,
            :message => "Post Updated Saved Successfully",
            :data => @save_post
        }
    else
        @save_post = SavePost.new
        @save_post.title = 'save'
        @save_post.post_id = @post_id
        @save_post.user_id = @user.id
        @save_post.save
        @response = {
            :status => 200,
            :message => "Post Saved Successfully",
            :data => @save_post
        }
    end
    render json: @response

  end

  #GET user-unsave-post/:post_id
  def user_unsave_post
    @post_id = params[:post_id];
    @save_post = @user.save_posts.find_by(post_id: @post_id)

    #if user has saved post b4
    if@save_post
        @save_post.title = 'unsave'
        @save_post.post_id = @post_id
        @save_post.user_id = @user.id
        @save_post.save
        @response = {
            :status => 200,
            :message => "Post Updated Unsaved Successfully",
            :data => @save_post
        }
    else
        @save_post = SavePost.new
        @save_post.title = 'unsave'
        @save_post.post_id = @post_id
        @save_post.user_id = @user.id
        @save_post.save
        @response = {
            :status => 200,
            :message => "Post Unsaved Successfully",
            :data => @save_post
        }
    end
    render json: @response

  end

end
