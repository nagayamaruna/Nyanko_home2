class Admin::NyankogramPostCommentsController < ApplicationController

  def index
    @nyankogram_post_comments = NyankogramPostComment.all
    @users = User.all
    if params[:keyword].present?
      @nyankogram_post_comments = @nyankogram_post_comments.where('id LIKE ?', "%#{params[:keyword]}%").or(
               @nyankogram_post_comments.where('name LIKE ?', "%#{params[:keyword]}%")).or(
               @nyankogram_post_comments.where('comment LIKE ?', "%#{params[:keyword]}%"))
    end
  end

  def destroy
    @nyankogram_post_comment= NyankogramPostComment.find(params[:id])
    @nyankogram_post_comment.destroy
    redirect_to admin_nyankogram_post_comments_path, notice: 'コメントを削除しました。'
  end
end
