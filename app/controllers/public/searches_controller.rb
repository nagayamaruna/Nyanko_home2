class Public::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Nyanko"
      @nyankos = Nyanko.looks(params[:search], params[:word])
    else
      @nyankograms = Nyankogram.looks(params[:search], params[:word])
    end
  end
end
