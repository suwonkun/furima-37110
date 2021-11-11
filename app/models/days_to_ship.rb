class  DaysToShip< ActiveHash::Base
  self.data = [
       {id: 0, days_to_ship: '---'},
       {id: 1, days_to_ship: '着払い（購入者負担）'},
       {id: 2, days_to_ship: '送料込み（出品者負担）'}, 
    ]
  include ActiveHash::Associations
  has_many :items
end