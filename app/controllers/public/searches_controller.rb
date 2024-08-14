class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @range = params[:range]

    if @range == "Nyanko"
      @nyankos = Nyanko.looks(params[:search], params[:word])
    else
      @nyankograms = Nyankogram.looks(params[:search], params[:word])
    end
  end
end
