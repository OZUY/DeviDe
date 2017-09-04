class UnivsController < ApplicationController

  def show
    @univ = Univ.find(params[:id])
  end

  def edit
    @univ = Univ.find(params[:id])
  end

  def update
    @univ = Univ.find(params[:id])
    @univ.update(update_params)
  end

  private
  def update_params
    params.require(:univ).permit(:key, :detail)
  end

end
