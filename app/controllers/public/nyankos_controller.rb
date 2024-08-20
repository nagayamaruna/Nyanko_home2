class Public::NyankosController < ApplicationController

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
      puts @nyanko.errors.full_messages
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
    @users = User.all
    if params[:keyword].present?
      @nyankos = @nyankos.where('title LIKE ?', "%#{params[:keyword]}%").or(
               @nyankos.where('body LIKE ?', "%#{params[:keyword]}%"))
    end
  end

  def show
    @nyanko = Nyanko.find(params[:id])
    @user = @nyanko.user
  end

  def edit
    @nyanko = Nyanko.find(params[:id])
    unless current_user
      redirect_to auth_login_path
    end
    unless current_user.id == @nyanko.user_id
      flash[:error] = "あなたはこの投稿を編集できません。"
      redirect_to "/nyankos"
    end
  end

  def update
    nyanko = Nyanko.find(params[:id])
    if nyanko.update(nyanko_params)
    flash[:notice] = "アップデートしました"
    redirect_to nyanko_path(nyanko)
    else
      @nyanko = nyanko
      @user = current_user
      render :edit
    end
  end

  private

  def nyanko_params
    params.require(:nyanko).permit(:title, :body, :image)
  end
end
