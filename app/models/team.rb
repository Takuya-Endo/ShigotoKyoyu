class Team < ApplicationRecord

  has_many :team_members, dependent: :destroy

end
