class Study < ApplicationRecord
  serialize :outline, Hash
  has_many :subtitles
  accepts_nested_attributes_for :subtitles, allow_destroy: true
  has_many :points, through: :subtitles
  has_many :notes, through: :points
  
  # validates_presence_of :title, :semester, :year, :number

  # def subtitles
  #   self.outline[:subtitles].keys
  # end

  # def points
  #   self.outline[:subtitles].each do |subtitle, values|
  #     group = []
  #     values.each do |point, note|
  #       points << point
  #     end
  #   end
  #   group
  # end
  
  def subtitle_index(subtitle)
    self.subtitles.index(subtitle)
  end

  def point_index(subtitle, point)
    index =""
    self.outline[:subtitles].each do |sub, points_array|
      if sub == subtitle
        points_array.each do |point_hash|
          point_hash.each do |pt, note|
            if pt == point
              index = points_array.index(point_hash)
            end
          end
        end
      end
    end
    index
  end

  # Define the id of a point as the union of the index of the point's subtitle and the point's index joined by a period
  def point_id(subtitle, point)
    
    "#{subtitle_index(subtitle) + 1}" + "." + "#{point_index(subtitle, point) + 1}"
  end

  def retrieve_point_by_id(point_id)

  end

  def activate_point(point)
  end

  def non_empty_notes
    self.notes.where("details != '""' ")
  end

  def non_empty_points
    self.points.where.not({ "name" => "" })
  end

  def at_least_two_subtitles
    self.subtitles.where({ "name" => "" })
  end

  def destroy_empties
  end

  def build_outline
  end


end

