class Meeting < ApplicationRecord

  belongs_to :event

  validates :title, presence: true

end
