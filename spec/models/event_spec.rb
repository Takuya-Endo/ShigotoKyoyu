require 'rails_helper'

RSpec.describe Event, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な予定の場合は保存されるか" do
      expect(FactoryBot.build(:event)).to be_valid
    end
  end
  context "event空白のバリデーションチェック" do
    it "start_dateが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      event = Event.new(start_date: '', time_span: '0:30')
      expect(event).to be_invalid
      expect(event.errors[:start_date]).to include("can't be blank")
    end
  end
  context "appointment空白のバリデーションチェック" do
    it "destinationが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      appointment = Appointment.new(destination: '', person_in_charge: 'hoge', contact_means: '訪問', nearest_station: 'hoge', travel_time: '0:30', participant: '個人' )
      expect(appointment).to be_invalid
      expect(appointment.errors[:destination]).to include("can't be blank")
    end
      it "person_in_chargeが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      appointment = Appointment.new(destination: 'hoge', person_in_charge: '', contact_means: '訪問', nearest_station: 'hoge', travel_time: '0:30', participant: '個人' )
      expect(appointment).to be_invalid
      expect(appointment.errors[:person_in_charge]).to include("can't be blank")
    end
    it "contact_meansが訪問の時nearest_stationが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      appointment = Appointment.new(destination: 'hoge', person_in_charge: 'hoge', contact_means: '訪問', nearest_station: '', travel_time: '0:30', participant: '個人' )
      expect(appointment).to be_invalid
      expect(appointment.errors[:nearest_station]).to include("can't be blank")
    end
  end
  context "meeting空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      meeting = Meeting.new(title: '', introduction: 'hoge')
      expect(meeting).to be_invalid
      expect(meeting.errors[:title]).to include("can't be blank")
    end
  end
  context "task空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      task = Task.new(title: '', introduction: 'hoge')
      expect(task).to be_invalid
      expect(task.errors[:title]).to include("can't be blank")
    end
  end
end