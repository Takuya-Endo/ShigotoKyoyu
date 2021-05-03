class Task < ApplicationRecord

  belongs_to :event
  enum deadline_status: { 締切あり: 1, 早急に対応: 2, なるべく早めに: 3, 手が空いたら: 4 }

end
