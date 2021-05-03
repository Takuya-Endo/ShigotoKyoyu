class Event < ApplicationRecord

  has_one :appointment, dependent: :destroy
  accepts_nested_attributes_for :appointment

  has_one :meeting, dependent: :destroy
  accepts_nested_attributes_for :meeting

end
