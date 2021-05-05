class Study < ApplicationRecord
  serialize :outline, Hash

  def subtitles
    self.outline[:subtitles].keys
  end

  def points
    self.outline[:subtitles].values
  end
  
  def subtitle_index(subtitle)
    self.subtitles.index(subtitle)
  end

  def point_index(subtitle, point)
    index =""
    self.outline[:subtitles].each do |sub, pts|
      if sub == subtitle
        pts.each do |pt|
          if pt == point
            index = pts.index(point)
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
