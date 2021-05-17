require 'rails_helper'

RSpec.describe User, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な新規登録の場合は保存されるか" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "last_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(last_name: '', first_name: 'hoge', last_name_kana: 'hoge', first_name_kana: 'hoge', email_is_published: 'true', email: 'test@email.com', password: 'hoge-huga')
      expect(user).to be_invalid
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    it "first_nameが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(last_name: 'hoge', first_name: '', last_name_kana: 'hoge', first_name_kana: 'hoge', email_is_published: 'true', email: 'test@email.com', password: 'hoge-huga')
      expect(user).to be_invalid
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    it "last_name_kanaが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(last_name: 'hoge', first_name: 'hoge', last_name_kana: '', first_name_kana: 'hoge', email_is_published: 'true', email: 'test@email.com', password: 'hoge-huga')
      expect(user).to be_invalid
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    it "first_name_kanaが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(last_name: 'hoge', first_name: 'hoge', last_name_kana: 'hoge', first_name_kana: '', email_is_published: 'true', email: 'test@email.com', password: 'hoge-huga')
      expect(user).to be_invalid
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    it "email_is_publishedが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(last_name: 'hoge', first_name: 'hoge', last_name_kana: 'hoge', first_name_kana: 'hoge', email_is_published: '', email: 'test@email.com', password: 'hoge-huga')
      expect(user).to be_invalid
      expect(user.errors[:email_is_published]).to include("can't be blank")
    end
    it "emailが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(last_name: 'hoge', first_name: 'hoge', last_name_kana: 'hoge', first_name_kana: 'hoge', email_is_published: 'true', email: '', password: 'hoge-huga')
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "passwordが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      user = User.new(last_name: 'hoge', first_name: 'hoge', last_name_kana: 'hoge', first_name_kana: 'hoge', email_is_published: 'true', email: 'test@email.com', password: '')
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("can't be blank")
    end
  end
end