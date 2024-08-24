class Public::NyankogramsController < ApplicationController
  def new
    @nyankogram = Nyankogram.new
    render :new
  end

  def create
    @nyankogram = Nyankogram.new(nyankogram_params)
    @nyankogram.user_id = current_user.id
    @nyankogram.save
    flash[:notice] = "投稿しました。"
    redirect_to nyankograms_path
  end

  def index
    @nyankograms = Nyankogram.all
    @users = User.all
    if params[:keyword].present?
      @nyankograms = @nyankograms.where('name LIKE ?', "%#{params[:keyword]}%").or(
               @nyankograms.where('post_body LIKE ?', "%#{params[:keyword]}%"))    
    end
  end

  def show
    @nyankogram = Nyankogram.find(params[:id])
    @user = @nyankogram.user
    @nyankogram_post_comment = NyankogramPostComment.new
  end

  def destroy
    nyankogram = Nyankogram.find(params[:id])
    nyankogram.destroy
    redirect_to "/nyankograms"
  end

  private

  def nyankogram_params
  params.require(:nyankogram).permit(:nyankogram_image, :post_body)
  end
end
