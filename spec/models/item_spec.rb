require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "ユーザー新規登録できる時" do
    it "全ての項目の入力が存在すれば登録できること" do
    expect(@item).to be_valid
    end
  end

  describe "出品登録できない時" do
    it "商品名が必須であること" do
      @item.item_name  = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it "説明文が必須であること" do
      @item.explanation  = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "カテゴリーの選択が必須であること" do
      @item.category_id   = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it "商品の状態の選択が必須であること" do
      @item.status_id    = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
    end
    it "配送料の選択が必須であること" do
      @item.derivery_charge_id    = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Derivery charge must be other than 0")
    end
    it "地域の選択が必須であること" do
      @item.area_id    = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 0")
    end
    it "地域の選択が必須であること" do
      @item.days_to_ship_id     = '0'
      @item.valid?
      expect(@item.errors.full_messages).to include("Days to ship must be other than 0")
    end
    it "価格の入力が必須であること" do
      @item.price     = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end
    it "価格は半角数値のみ保存可能" do
      @item.price     = '１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "価格が300円未満では出品できない" do
      @item.price     = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "価格が9_999_999円を超えると出品できない" do
      @item.price     = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 1000000")
    end
    it "画像が必須であること" do
      @item.image     = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "userが紐付いていなければ出品できない" do
      @item.user    = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end  
end
