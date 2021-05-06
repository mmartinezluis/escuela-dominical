class StudiesController < ApplicationController


  def index
    @studies = Study.all
  end

  def show
    @study = Study.first
  end



end
