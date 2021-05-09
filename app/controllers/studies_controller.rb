class StudiesController < ApplicationController

  def index
    @studies= Study.all
  end

  def show
    @study = Study.find(params[:id])
  end

  def new
    @study = Study.new
    # 3.times { @study.subtitles.build} 
    3.times { 
      subtitle = @study.subtitles.build
      2.times { 
        point = subtitle.points.build 
        point.notes.build
      }
    }
  end

  def create
    binding.pry
    @study = Study.create(study_params)
    redirect_to new_study_path  
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
