class Point < ApplicationRecord
  belongs_to :subtitle
  has_one :note, dependent: :destroy
  # accepts_nested_attributes_for :note, reject_if: proc { |attributes| attributes["details"].blank? }
  accepts_nested_attributes_for :note, reject_if: 

  private
   
    def note_rejectable(attr)
      attr["details"].blank?
    end

end