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
  
end
