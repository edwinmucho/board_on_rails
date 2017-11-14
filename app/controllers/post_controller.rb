class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    
  end

  def create
    title = params[:title]
    content = params[:content]
    user_id = session[:user_id]
    Post.create(
      title: title,
      content: content,
      user_id: user_id
      )
      
    redirect_to '/'
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.all
  end
  
  def modify
    @post = Post.find(params[:id])
  end
  
  def update
    @id = params[:id]
    @post = Post.find(@id)
    @post.update(title: params[:title], content: params[:content])    
    
    redirect_to "/post/show/#{@id}"
  end
  
  def destroy
    @id = params[:id]
    @post = Post.find(@id)
    @post.destroy
    
    redirect_to '/'
  end
  
  def create_comment
    @comment = params[:comment]
    Comment.create(
      content: @comment,
      post_id:params[:post_id]
      )
    redirect_to :back
  end
end
