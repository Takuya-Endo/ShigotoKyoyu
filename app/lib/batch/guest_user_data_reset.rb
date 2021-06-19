class Batch::GuestUserDataReset
  def self.guest_user_data_reset

    Event.where(user_id: 3).destroy_all
    p "ゲストユーザーの仕事を全て削除しました"

    # 今週の火曜日に資料作成の予定をサンプルとして追加するバッチ処理
    # Event.create(user_id: 3)
    # Task.create(deadline_status: 2, title: "資料作成" start_date: Date.today.beginning_of_week + 1.day)


    # 資料作成の予定をサンプルとして追加するバッチ処理
    event = Event.create(user_id: 3, start_date: Time.now, task_attributes: {deadline_status: "早急に対応", title: "資料作成", introduction: "", participant: "個人"}, end_date: "", team_id: "")
    task = Task.find_by(event_id: event.id)
    Event.update(task_id: task.id, end_date: event.start_date.since(3.years))
    p "ゲストユーザーのサンプルtaskを追加しました"

  end
end