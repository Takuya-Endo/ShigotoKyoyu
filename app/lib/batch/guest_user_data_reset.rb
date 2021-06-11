class Batch::GuestUserDataReset
  def self.guest_user_data_reset
    Event.where(user_id: 3).delete_all
    p "ゲストユーザーの仕事を全て削除しました"
  end
end