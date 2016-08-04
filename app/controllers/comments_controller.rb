class CommentsController < ApplicationController




  def index

    @my_comments = @commentable.comments.all(params[:comment])
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    before_action :authenticate_user!
    @comment = Comment.new

  end



  # GET /organizations/1/edit
  def update
    before_action :authenticate_user!
  end




  # GET /organizations/1/edit
  def edit
    before_action :authenticate_user!
  end

  #before_filter :load_commentable
  def create
    #before_action :authenticate_user!
    puts '------------------PARAMS------------------------------'
    puts params
    puts '------------------PARAMS------------------------------'

    model_class = params[:comment][:commentable_type].classify.constantize
    @commentable = model_class.find(params[:comment][:commentable_id])
    #authorize! :comment, @commentable
    @comment = Comment.build_from(@commentable, 1, params[:comment][:body])
    #@comment = Comment.build_from(@commentable, @current_user.id, params[:comment][:body])
    #@comment.parent_id = params[:comment][:parent_id]
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: 'Comment was successfully created.' }
        #format.js
      else
        format.html { redirect_to @commentable }
        #format.js
      end
    end


  end

  protected

  def load_commentable
    @commentable = params[:commentable].classify.constantize.find(commentable_id)
    #@commentable= params[:commentable_type].find(params[:commentable_id])
  end
end


