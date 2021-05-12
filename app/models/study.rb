class Study < ApplicationRecord
  serialize :outline, Hash
  has_many :subtitles, dependent: :destroy               # 'dependent: :destroy' is a callback method that allows the destruction of child objects when the parent object is destroyed; example: destroy a study, and all subtitles for that study will also be destroyed.
  accepts_nested_attributes_for :subtitles, allow_destroy: true
  has_many :points, through: :subtitles
  has_many :notes, through: :points
  
  # validates_presence_of :title, :semester, :year, :number     ADD LATER

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
    if self.non_empty_notes != [] || self.non_empty_points != [] || self.first_two_subtitles.size >= 1
      if self.non_empty_notes != [] || self.non_empty_points != []
        if non_empty_notes_points.any?{ |pt| pt.name.blank? }
          "Nonempty notes need to include a point."
        elsif non_empty_points_subtitles.any?{ |sub| sub.name.blank? }
          "Nonempty points need to include a subtitle."
        else
          check_subtitles_and_first_point
        end
      else
        check_subtitles_and_first_point
      end
    else
      "The first subtitle and the first point cannot be emtpy, and a study requires at least 2 subtitles."
    end
  end

  def check_subtitles_and_first_point
    if self.first_two_subtitles.size <= 1
      "A study requires at least 2 subtitles."
    elsif self.first_subtitle_empty?
      "The first subtitle cannot be empty."
    elsif self.top_point_empty?
      "The first point for the first subtitle cannot be empty."
    end
  end

  def non_empty_notes
    self.notes.where.not("details = ?", "")
  end

  def non_empty_notes_points
    non_empty_notes.collect do |note|
      note.point
    end
  end

  def non_empty_points
    self.points.where.not({ "name" => "" })
  end

  def non_empty_points_subtitles
    non_empty_points.collect do |point|
      point.subtitle
    end
  end

  def non_empty_subtitles
    self.subtitles.where.not({"name" => ""})
  end

  def first_two_subtitles
    self.subtitles.limit(2).where.not({"name" => ""})
  end

  def first_subtitle_empty?
    self.subtitles.first.name.blank?
  end

  def top_point_empty?
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
    self.outline = {}
    self.outline[:title] = self.title
    self.outline[:semester] = self.semester
    self.outline[:year] = self.year
    self.outline[:number] = self.number
    self.build_subtitles
    self.save
  end

  def build_subtitles
    # For the outline hash, set a key-value pair consisting of a 'subtitles' symbol key and an empty hash value
    self.outline[:subtitles] = {}
    m = self.subtitles.size
    # Construct one empty array for each subtitle key
    m.times { |i|
      self.outline[:subtitles][self.subtitles[i].name] = []
    }
    # For each subtitle key:
    m.times { |i|
      j = self.subtitles[i].points.size
      k = 0
      # For each point within each subtitle, construct a hash with a key of the point name and a value of that point's note details and push the hash to the subttitle's array
      while k < j
        subtitle = self.subtitles[i]
        point = subtitle.points[k]
        note = point.notes[0]
      
        self.outline[:subtitles][subtitle.name] << {point.name => note ? note.details : "" } if point
        
        k += 1
      end
    }
  end

end

