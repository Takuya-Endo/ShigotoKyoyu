class Team < ApplicationRecord

  has_many :team_members, dependent: :destroy
  has_many :users, through: :team_members

  validates :team_name, presence: true

end
