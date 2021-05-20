class Event < ApplicationRecord

  has_one :appointment, dependent: :destroy
  accepts_nested_attributes_for :appointment

  has_one :meeting, dependent: :destroy
  accepts_nested_attributes_for :meeting

  has_one :task, dependent: :destroy
  accepts_nested_attributes_for :task

  validates :start_date, presence: true



  validates_associated :appointment
  validates_associated :meeting
  validates_associated :task

  validates :team_id, presence: false, if: :individual_appointment, on: :appointment_create
  def individual_appointment
    appointment.participant == "個人"
  end

  validates :team_id, presence: true, if: :team_appointment, on: :appointment_create
  def team_appointment
    appointment.participant == "チーム"
  end

  validates :team_id, presence: true, on: :meeting_create

  validates :team_id, presence: false, if: :individual_task, on: :task_create
  def individual_task
    task.participant == "個人"
  end

  validates :team_id, presence: true, if: :team_task, on: :task_create
  def team_task
    task.participant == "チーム"
  end

  validates :end_date, presence: true, if: :task_status, on: :task_create
  def task_status
    task.deadline_status == "締切あり"
  end

end