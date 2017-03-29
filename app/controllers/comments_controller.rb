class CommentsController < ApplicationController
  # load_and_authorize_resource


  def destroy


  end

  # private

  def comment_params
    params.require(:comment).permit :content, :user_id, :product_id
  end
end
