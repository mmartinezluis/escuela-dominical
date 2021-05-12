class StudiesController < ApplicationController

  def index
    @studies= Study.all
  end

  def show
    @study = Study.find(params[:id])
  end

  def new
    @study = Study.new
    # @study.subtitles.build.points.build.notes.build
    2.times { 
      subtitle = @study.subtitles.build
      2.times { 
        point = subtitle.points.build 
        point.notes.build
      }
    }
    render :'new_refactor.html.erb'
  end

  def create
    temporary_study = Study.create(study_params)
    if !temporary_study.invalid_study.nil?
      flash[:msg] = temporary_study.invalid_study
      temporary_study.destroy
      render :'new_refactor.html.erb' and return
    else
      temporary_study.destroy
      @study = Study.new(study_params)
      @study.destroy_empties
      @study.build_outline
      binding.pry
      @study.save
      redirect_to studies_path 
    end 
  end


  private

  def study_params
    params.require(:study).permit(
      :title, 
      :semester,
      :year, 
      :number, 
      :subtitles_attributes => [:name, :_destroy,
        :points_attributes => [:name,
          :notes_attributes => [:details
          ]
        ]
      ]
    )
  end

end
