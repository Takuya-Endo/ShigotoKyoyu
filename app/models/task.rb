class Task < ApplicationRecord

  enum deadline_status: { 締切あり: 1, 早急に対応: 2, なるべく早めに: 3, 手が空いたら: 4 }

  belongs_to :event

end
