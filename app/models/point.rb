class Point < ApplicationRecord
  belongs_to :subtitle
  has_one :note, dependent: :destroy
  accepts_nested_attributes_for :note
end