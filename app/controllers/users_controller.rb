class UsersController < ApplicationController
  def show
    @nyanko = Nyanko.new
    @user = User.find(params[:id])
    @nyankos = @user.nyankos
    
  end

  def edit
  end
end
