class Subtitle < ApplicationRecord
  belongs_to :study
  has_many :points, dependent: :destroy
  has_many :notes, through: :points
  accepts_nested_attributes_for :points, allow_destroy: true
  before_save :mark_children_for_removal

  private
    def mark_children_for_removal
      points.each do |point|
        point.mark_for_destruction if point.name.blank?
      end
    end

end