require 'rails_helper'

RSpec.describe Team, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な新規作成の場合は保存されるか" do
      team = Team.new(team_name: 'hoge')
      expect(team).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "team_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      team = Team.new(team_name: '')
      expect(team).to be_invalid
      expect(team.errors[:team_name]).to include("can't be blank")
    end
  end
end