class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :team_members, dependent: :destroy
  has_many :teams, through: :team_members

  def self.guest
    find_or_create_by!(email: 'guest_user@email.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "ゲスト"
      user.first_name = "ユーザー"
      user.last_name_kana = "ゲスト"
      user.first_name_kana = "ユーザー"
      user.email_is_published = true
    end
  end

end
