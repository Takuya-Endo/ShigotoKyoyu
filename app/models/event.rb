class Event < ApplicationRecord

  has_one :appointment, dependent: :destroy

end
