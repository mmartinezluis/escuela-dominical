class Study < ApplicationRecord
  serialize :outline, Hash

  def subtitles
    self.outline[:subtitles].keys
  end

  def points
    self.outline[:subtitles].values
  end
  
end
