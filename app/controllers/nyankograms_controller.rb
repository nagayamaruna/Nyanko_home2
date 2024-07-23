class NyankogramsController < ApplicationController
  def new
    @nyankogram = Nyankogram.new
    render :new
  end

  def create
    @nyankogram = Nyankogram.new(nyankogram_params)
    @nyankogram.user_id = current_user.id
    @nyankogram.save
    redirect_to nyankograms_path
  end

  def index
    @nyankograms = Nyankogram.all
  end

  def show
    @nyankogram = Nyankogram.find(params[:id])
  end

  private

  def nyankogram_params
  params.require(:nyankogram).permit(:nyankogram_image, :post_body)
  end
end
