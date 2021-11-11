FactoryBot.define do
  factory :item do
    item_name                {'確認'}
    explanation              {'説明'}
    category_id              {'1'}
    status_id                {'1'}
    derivery_charge_id       {'1'}
    area_id                  {'1'}
    days_to_ship_id          {'1'}
    price                    {'1000'}
    association :user
    
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
