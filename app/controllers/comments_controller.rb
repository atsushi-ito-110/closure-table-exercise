class CommentsController < ApplicationController

  before_action :comments, only: [:index, :create, :new_reply, :reply]

  def index
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render :index
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @comment.replies.build
  end

  def new_reply
    @comment = Comment.new
    @comments = @comments.map do |comment|
      if comment.id == params[:id].to_i
        comment.replies.build
      end
      comment
    end
    render :index
  end

  def reply
    @comment = Comment.new
    parent = Comment.find(params[:id])
    parent.replies.build(comment_params)
    if parent.save
      redirect_to comments_path
    else
      render :index
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

  def comments
    # if リプが無いものを表示したい場合これ
    # child_ids = Closure.all.pluck(:descendant_id).uniq
    # @comments = Comment.where.not(id: child_ids).order(id: 'desc')
    # elsif 全件表示する場合
    @comments = Comment.preload(:replies).order(id: 'desc').limit(15)
  end
end
