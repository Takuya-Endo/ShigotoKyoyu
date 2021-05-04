class Team < ApplicationRecord

  has_many :team_menmbers, dependent: :destroy

end
