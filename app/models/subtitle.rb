class Subtitle < ApplicationRecord
  belongs_to :study
  has_many :points, dependent: :destroy
  accepts_nested_attributes_for :points
end