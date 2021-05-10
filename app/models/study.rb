class Study < ApplicationRecord
  serialize :outline, Hash
  has_many :subtitles, dependent: :destroy
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

  def invalid_study
    if self.non_empty_notes != []
      non_empty_notes = self.non_empty_notes
      non_empty_notes.each do |note|
        if note.point.name.empty?
          "Nonempty notes need to include a point."
        elsif note.point.subtitle.name.empty?
          "Nonempty points need to include a subtitle."
        end
      end
    elsif self.non_empty_points != []
      non_empty_points = @tempporary_study.non_empty_points
      non_empty_points.each do |point|
        if point.subtitle.name.empty?
          "Nonempty points need to include a subtitle."
        end
      end
    elsif self.subtitles.first.name.blank? && self.at_least_two_subtitles <= 1
      "The first subtitle cannot be emtpy, and a study requires at least 2 subtitles."
    elsif self.subtitles.first.name.blank?
      "The first subtitle cannot be emtpy."
    elsif self.at_least_two_subtitles.size <= 1
      "A study requires at least 2 subtitles."
    elsif self.top_point_not_empty == false
      "The firt subtitle's point cannot be empty."
    end
  end

  def non_empty_notes
    self.notes.where("details != '""' ")
  end

  def non_empty_points
    self.points.where.not({ "name" => "" })
  end

  def at_least_two_subtitles
    self.subtitles.where.not({ "name" => "" }).size
  end

  def top_point_not_empty
    self.points.first.name.blank?
  end

  def destroy_empties
    destroy_empty_subtitles
    destroy_empty_points
    destroy_empty_notes
  end

  def destroy_empty_subtitles
    self.subtitles.where({ "name" => "" }).each do |sub|
      sub.destroy
    end
  end

  def destroy_empty_points
    self.points.where({ "name" => "" }).each do |point|
      point.destroy
    end
  end

  def destroy_empty_notes
    self.subtitles.where("details != '""' ").each do |note|
      note.destroy
    end
  end

  def build_outline
  end


end

