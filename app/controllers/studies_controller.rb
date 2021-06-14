class StudiesController < ApplicationController

  def index
    @studies = Study.all
  end

  def show
    @study = Study.find(params[:id])
  end

  def new
    @study = Study.new
    2.times { 
      subtitle = @study.subtitles.build
      1.times { 
        point = subtitle.points.build 
        note = point.build_note
      }
    }
  end

  def create    
    @study = Study.new(study_params)
    if @study.valid?
      @study.build_outline
      @study.save
      redirect_to studies_path
    else
      render :new
    end
  end

    def destroy
      study = Study.find_by(id: params[:id])
      study.destroy
      redirect_to studies_path
    end


  private

  def study_params
    params.require(:study).permit(
      :title, :semester, :year, :number, :biblical_base,
      subtitles_attributes: [ :name, :_destroy,       # '_destroy' provides a checkbox in the study new/edit form to destroy the subtitle if checked
        points_attributes: [ :name,
          note_attributes: [ :details ]
        ]
      ]
    )
  end

end
