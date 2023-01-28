class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成
    @list = List.new
  end

  def create
    list = List.new(list_params)
    list.save
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end


# ↓このコントローラー内でしか呼べない
  private
  # ストリングパラメータ
  def list_params
    params.require( :list).permit(:title, :body)
  end
end
