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
    @study = Study.create(study_params)
    if @study.non_empty_notes != []
      non_empty_notes = @study.non_empty_notes
      non_empty_notes.each do |note|
        if note.point.name.empty?
          flash[:msg] = "Non-empty notes need to include a point."
          render :'new_refactor.html.erb' and return
        elsif note.point.subtitle.name.empty?
          flash[:msg] = "Non-empty points need to include a subtitle."
          render :'new_refactor.html.erb' and return
        end
      end
    elsif @study.non_empty_points != []
      non_empty_points = @study.non_empty_points
      non_empty_points.each do |point|
        if point.subtitle.name.empty?
          flash[:msg] = "Non-empty points need to include a subtitle."
          render :'new_refactor.html.erb' and return
        end
      end
    elsif @study.subtitles.first.name.blank? && @study.at_least_two_subtitles.size <= 1
      flash[:msg] ="The first subtitle cannot be emtpy, and a study requires at least 2 subtitles."
      render :'new_refactor.html.erb' and return
    elsif @study.subtitles.first.name.blank?
      flash[:msg] ="The first subtitle cannot be emtpy."
      render :'new_refactor.html.erb' and return
    elsif @study.at_least_two_subtitles.size <= 1
      flash[:msg] ="A study requires at least 2 subtitles."
      render :'new_refactor.html.erb' and return
    end
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
