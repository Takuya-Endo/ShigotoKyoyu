class Appointment < ApplicationRecord

  enum participant: { 個人: 1, チーム: 2 }

  belongs_to :event

  validates :destination, presence: true
  validates :person_in_charge, presence: true

  validates :nearest_station, presence: true, if: :contact_means_visit
  def contact_means_visit
    contact_means == "訪問"
  end

end