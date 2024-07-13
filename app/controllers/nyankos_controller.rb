class NyankosController < ApplicationController
  def new
    @nyanko = Nyanko.new
    render :new
  end

  def create
    @nyanko = Nyanko.new(nyanko_params)
    @nyanko.user_id = current_user.id
    if @nyanko.save
      flash[:notice] = "投稿しました。"
      redirect_to nyanko_path(@nyanko)
    else
      render :new
    end
  end

  def index
    @nyanko = Nyanko.all
  end

  def show
    @nyanko_post = Nyanko.find(params[:id])
    @nyanko_post = Nyanko.all
  end

  def edit
  end

  private

  def nyanko_params
    params.require(:nyanko).permit(:titli, :body, :image)
  end
end
