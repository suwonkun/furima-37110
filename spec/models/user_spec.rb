require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    it "ニックネームが必須であること" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "メールアドレスが必須であること" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'a.a'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは、6文字以上での入力が必須であること' do
      @user.password = 'a0000'
      @user.password_confirmation = 'a0000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password_confirmation = ''
      @user.valid?

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "名字が空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名前が空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.first_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
      @user.last_name = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "フリガナ（名字）が空だと登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "フリガナ（名前）が空だと登録できない" do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.first_name_kana = 'かな'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
      @user.last_name_kana = "かな"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it "生年月日が空だと登録できない" do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

  end
end