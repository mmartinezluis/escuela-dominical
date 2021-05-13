class Subtitle < ApplicationRecord
  belongs_to :study
  has_many :points, dependent: :destroy
  has_many :notes, through: :points
  accepts_nested_attributes_for :points
end