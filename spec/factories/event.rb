FactoryBot.define do
  factory :event do
    user_id { '1' }
    start_date { '2000-01-01 0:00' }
    time_span { "0:30" }
  end
end