require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do

  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buyer_address = FactoryBot.build(:buyer_address,user_id: @user.id,item_id: @item.id)
    sleep 0.1
  end

  describe '購入情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyer_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buyer_address.building_name = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @buyer_address.postal_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Postal code can't be blank")
       end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyer_address.postal_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it "都道府県の選択が必須であること" do
        @buyer_address.area_id    = '0'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Area must be other than 0")
      end
      it "市区町村の入力が必須であること" do
        @buyer_address.municipalities    = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "番地の入力が必須であること" do
        @buyer_address.address    = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号の入力が必須であること" do
        @buyer_address.telephone_number    = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it "tokenが必須であること" do
        @buyer_address.token    = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it "9桁以下では登録できないこと" do
        @buyer_address.telephone_number   = '11111111'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it "12桁以上では登録できないこと" do
        @buyer_address.telephone_number    = '1111111111111'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it "電話番号に半角英数字以外が含まれていると登録できないこと" do
        @buyer_address.telephone_number    = 'ああああああ'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it "userが紐付いていなければ出品できない" do
        @buyer_address.user_id   = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていなければ出品できない" do
      @buyer_address.item_id    = nil
      @buyer_address.valid?
      expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end