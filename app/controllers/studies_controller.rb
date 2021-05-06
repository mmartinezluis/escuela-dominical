class StudiesController < ApplicationController


  def index

  end

  def show
    @study = Study.find(params[:id])
  end



end
