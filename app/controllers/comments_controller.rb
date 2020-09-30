# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable

  def create
    @comment  = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save!

    redirect_to @commentable
  end

  private
    def set_commentable
      resource, id = request.path.split("/")[1, 2]
      @commentable = resource.singularize.classify.constantize.find(id)
    end

    def comment_params
      params.require(:comment).permit(:body, :commentable_type, :commentable_id)
    end
end
