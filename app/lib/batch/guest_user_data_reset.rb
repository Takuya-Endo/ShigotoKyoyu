class Batch::GuestUserDataReset
  def self.guest_user_data_reset

    Event.where(user_id: 3).destroy_all # FIXME:ネストされたtasksが削除されていない
    p "ゲストユーザーの仕事を全て削除しました"

    # TODO:今週の火曜日に資料作成の予定をサンプルとして追加するバッチ処理
    # Event.create(user_id: 3)
    # Task.create(deadline_status: 2, title: "資料作成" start_date: Date.today.beginning_of_week + 1.day)
    # p "ゲストユーザーのサンプルtaskを追加しました"

  end
end