class Study < ApplicationRecord
  serialize :outline, Hash
  has_many :subtitles, dependent: :destroy, autosave: true               # 'dependent: :destroy' is a callback method that allows the destruction of child objects when the parent object is destroyed; example: destroy a study, and all subtitles for that study will also be destroyed.
  accepts_nested_attributes_for :subtitles, allow_destroy: true           # Provides a 'delete' checkbox in the study new/edit forms so that if the checkbox is hit the given subtitle is deleted upon submisssion of the form
  has_many :points, through: :subtitles, autosave: true                 # 'Autosave' allows to save the parent and the children on both the create action and the update action
  has_many :notes, through: :points, autosave: true

  # validates_presence_of :title, :semester, :year, :number     ADD LATER
  include ActiveModel::Validations
  validates_with SubtitleValidator
  validates_with PointValidator
  validates_with NoteValidator
  validates_with PointSubtitleValidator
  
  before_save :mark_children_for_removal

  
  def build_outline
    self.outline = {}
    self.outline[:title] = self.title
    self.outline[:semester] = self.semester
    self.outline[:year] = self.year
    self.outline[:number] = self.number
    self.outline[:biblical_base] = self.biblical_base
    self.save
    self.build_subtitles
  end

  def build_subtitles
    # For the outline hash, set a key-value pair consisting of a 'subtitles' symbol key and a corresponding empty hash value
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
      # For each point within each subtitle, construct a hash with a key of the point name and a value of that point's note details and push the hash to the point's subttitle array
      while k < j
        subtitle = self.subtitles[i]
        point = subtitle.points[k]
        note = point.note
        self.outline[:subtitles][subtitle.name] << { point.name => note ? note.details : "" } if point
        k += 1
      end
    }
  end

  # This method is only used for creating studies from the seeds file
  def create_subtitles
    self.outline[:subtitles].each do |subtitle, points_array|
      new_subtitle = self.subtitles.build(name: subtitle)
      points_array.each do |point_hash|
        point_hash.each do |point, note|
          new_point = new_subtitle.points.build(name: point)
          new_note = new_point.note.build(details: note)
        end
      end
    end
  end

  private
    def mark_children_for_removal
      subtitles.each do |subtitle|
        subtitle.mark_for_destruction if subtitle.name.blank?
      end
    end

end

