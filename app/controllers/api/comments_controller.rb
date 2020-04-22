# frozen_string_literal: true

class Api::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_user_and_article

  def create
    comment = Comment.create(comment_params)
    if comment.persisted?
      render json: { message: 'Your comment has been posted' }
    else
      render json: { message: 'You cannot post an empty comment' }, status: 400
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :article_id, :user_id)
  end

  def verify_user_and_article
    if comment_params['article_id'].nil? || comment_params['user_id'].nil?
      render json: { message: 'Whoops, it seems like we have an internal issue' }, status: 400
    end
  end
end
