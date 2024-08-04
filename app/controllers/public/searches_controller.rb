class SearchesController < ApplicationController
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    
    # 選択したモデルに応じて検索を実行
    if @model  == "nyanko"
      @records = Nyanko.search_for(@content, @method)
    else
      @records = Nyankogram.search_for(@content, @method)
    end
  end
end
