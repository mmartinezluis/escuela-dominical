class StudiesController < ApplicationController


  def index
    @studies = Study.all
  end

  def show
    @study = Study.first
    redireto_to study_path(@study)
  end

end
