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
      redirect_to nyankos_path
    else
      render :new
    end
  end

  def destroy
    nyanko = Nyanko.find(params[:id])
    nyanko.destroy
    redirect_to "/nyankos"
  end

  def index
    @nyankos = Nyanko.all
  end

  def show
    @nyanko = Nyanko.find(params[:id])
    @nyanko = Nyanko.new
    @user = @nyanko.user
  end

  def edit
  end

  private

  def nyanko_params
    params.require(:nyanko).permit(:title, :body, :image)
  end
end
