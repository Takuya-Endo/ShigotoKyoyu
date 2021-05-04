class TeamMember < ApplicationRecord

  enum privilege: { ○: 1, ×: 2 }
  enum join_status: { 参加済: 1, 招待中: 2 }

  belongs_to :user
  belongs_to :team

end
