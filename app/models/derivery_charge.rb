class  DeriveryCharge< ActiveHash::Base
  self.data = [
       {id: 0, derivery_charge: '---'},
       {id: 1, derivery_charge: '着払い（購入者負担）'},
       {id: 2, derivery_charge: '送料込み（出品者負担）'}, 
    ]
  include ActiveHash::Associations
  has_many :items
end