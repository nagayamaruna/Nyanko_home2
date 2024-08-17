class Admin::NyankogramPostCommentController < ApplicationController

  def index
    @nyankogram_post_comments = NyankogramPostComment.all
    @users = User.all
  end

  def destroy
    @nyankogram_post_comment= NyankogramPostComment.find(params[:id])
    @nyankogram_post_comment.destroy
    redirect_to admin_nyankogram_post_comments_path
  end
end
