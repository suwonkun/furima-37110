class BuyerAddress
  include ActiveModel::Model
  attr_accessor :item_id,:user_id,:postal_code,:area_id,:municipalities,:address,:building_name,:telephone_number,:buy_id,:token

  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipalities  
    validates :address
    validates :telephone_number,format: {with:/\A\d{11}\z/}
    validates :token
  end
  validates :area_id, numericality: { other_than: 0 }

  def save

    buy = Buy.create(item_id: item_id, user_id: user_id)

    Address.create(postal_code: postal_code, area_id: area_id , municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number,buy_id: buy.id)
  end
end