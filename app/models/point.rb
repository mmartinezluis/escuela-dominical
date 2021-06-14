class Point < ApplicationRecord
  belongs_to :subtitle
  has_one :note, dependent: :destroy
  accepts_nested_attributes_for :note#, reject_if: proc { |attributes| attributes["details"].blank? }
  # accepts_nested_attributes_for :note, reject_if: :note_rejectable?
  before_save :mark_children_for_removal

  private
    def mark_children_for_removal
      note.mark_for_destruction if note.details.blank?
    end

  #   def note_rejectable?(attr)
  #     attr["details"].blank? && new_record?
  #   end

end