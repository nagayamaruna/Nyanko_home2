class Public::NyankogramPostCommentsController < ApplicationController
  def create
    nyankogram = Nyankogram.find(params[:nyankogram_id])
    comment = current_user.nyankogram_post_comments.new(nyankogram_post_comment_params)
    comment.nyankogram_id = nyankogram.id
    comment.save
    redirect_to nyankogram_path(nyankogram)
  end

  private

  def nyankogram_post_comment_params
    params.require(:nyankogram_post_comment).permit(:comment)
  end
end