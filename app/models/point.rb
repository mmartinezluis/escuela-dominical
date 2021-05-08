class Point < ApplicationRecord
  belongs_to :subtitle
  has_many :notes
  accepts_nested_attributes_for :notes
end