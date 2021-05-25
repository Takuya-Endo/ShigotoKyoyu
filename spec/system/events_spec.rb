require 'rails_helper'

describe 'ユーザログイン後のテスト' do
  let(:user) { create(:user) }
  # let!(:other_user) { create(:user) }
  # let!(:event) { create(:event, user: user) }
  # let!(:other_event) { create(:event, user: other_user) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'メイン画面のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'root_pathが"/"であるか' do
        expect(current_path).to eq('/')
      end
      # it 'メインカレンダーに予定が表示されているか' do
      # end
      # it '2週間カレンダーに予定が表示されているか' do
      # end
    end
    context 'リンクの確認' do
      it '新しい予定の追加ボタンが表示され、リンク先が正しいか' do
        expect(page).to have_link "", href: new_event_path
      end
    #   it '表示されている予定のリンク先が正しいか' do
    #   end
    end
  end

  describe "appointment新規登録画面のテスト" do
    before do
      visit new_appointment_path
    end
    context '表示の確認' do
      it '入力フォーム・登録ボタンが表示されているか' do
        expect(page).to have_field 'event[start_date]'
        # expect(page).to have_field 'event[time_span]'
        # expect(page).to have_field 'appointment[destination]'
        # expect(page).to have_field 'appointment[person_in_charge]'
        expect(page).to have_button '入力内容の確認'
      end
    end
  end

  # describe "appointment詳細画面のテスト" do
    # before do
      # visit appointment_path(appointment)
    # end
    # context '表示の確認' do
      # it '編集ボタンが表示されているか' do
        # expect(page).to have_link "", href: edit_appointment_path
      # end
  #     it '完了ボタンが表示されているか' do
  #     end
  #     it '削除ボタンが表示されているか' do
  #     end
    # end
  #   before do
  #     visit root_path
  #   end
  #   context 'リンク先の確認' do
  #     it '編集画面が表示されているか' do
  #     end
  #     it '完了確認画面が表示されているか' do
  #     end
  #   end
  #   before do
  #     visit root_path
  #   end
  #   context '更新処理の確認' do
  #     it '登録情報の更新ができているか' do
  #     end
  #     it '完了処理され表示が変わっているか' do
  #     end
  #     it 'データの削除ができているか' do
  #     end
  #   end
  # end

  # describe "meeting詳細画面のテスト" do
  #   before do
  #     visit root_path
  #   end
  #   context '表示の確認' do
  #     it '編集ボタンが表示されているか' do
  #     end
  #     it '完了ボタンが表示されているか' do
  #     end
  #     it '削除ボタンが表示されているか' do
  #     end
  #   before do
  #     visit root_path
  #   end
  #   end
  #   context 'リンク先の確認' do
  #     it '編集画面が表示されているか' do
  #     end
  #     it '完了確認画面が表示されているか' do
  #     end
  #   end
  #   before do
  #     visit root_path
  #   end
  #   context '更新処理の確認' do
  #     it '登録情報の更新ができているか' do
  #     end
  #     it '完了処理され表示が変わっているか' do
  #     end
  #     it 'データの削除ができているか' do
  #     end
  #   end
  # end

  # describe "task詳細画面のテスト" do
  #   before do
  #     visit root_path
  #   end
  #   context '表示の確認' do
  #     it '編集ボタンが表示されているか' do
  #     end
  #     it '完了ボタンが表示されているか' do
  #     end
  #     it '削除ボタンが表示されているか' do
  #     end
  #   before do
  #     visit root_path
  #   end
  #   end
  #   context 'リンク先の確認' do
  #     it '編集画面が表示されているか' do
  #     end
  #     it '完了確認画面が表示されているか' do
  #     end
  #   end
  #   before do
  #     visit root_path
  #   end
  #   context '更新処理の確認' do
  #     it '登録情報の更新ができているか' do
  #     end
  #     it '完了処理され表示が変わっているか' do
  #     end
  #     it 'データの削除ができているか' do
  #     end
  #   end
  # end

end