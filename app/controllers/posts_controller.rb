class PostsController < ApplicationController
  before_action :login_required, :only => [:edit, :update, :create,:show,:new]
  

  #get '/posts' => "posts#index"
  def index
    @posts=Post.all
  end

  #get '/posts/:id/edit' => "posts#edit"
  def edit
    @post=Post.find(params[:id])
    if !current_user_can?(:edit, @post)
      redirect_to "/posts", :notice => "Nope, you can't do that!"# and return
    end 
  end

  #patch '/posts/:id' => "posts#update"
  def update
    @post=Post.find(params[:id])
    if @post.update(post_attributes)
      redirect_to @post
    else
      render "edit"
    end
  end

  #get '/posts/new' => "posts#new"
  def new
      @post=Post.new
  end


  #post '/posts' => "posts#create"
  def create
    #raise params.inspect
    @post=Post.new(post_attributes)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end    
  end

  #get '/posts/:id' => "posts#show"
  def show
    @post=Post.find(params[:id])
    if !current_user_can?(:read, @post)
       redirect_to "/posts", :notice => "Nope, you can't do that!" #and return
    end 

  end



  private
    def post_attributes
      params.require(:post).permit(:title, :content)
    end
end
