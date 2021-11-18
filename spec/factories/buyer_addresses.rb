FactoryBot.define do
  factory :buyer_address do
    postal_code      { '123-4567' }
    area_id          { '1' }
    municipalities   { 'テスト' }
    address          { 'テスト' }
    building_name    {'テスト'}
    telephone_number { '00000000000' }
    buy_id           { '1' }
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
