class Product < ApplicationRecord
  validates :name, presence: true

  after_create :create_stripe_detail

  def create_stripe_detail
    prod = Stripe::Product.create({
      name: name,
      default_price_data: { unit_amount: price.to_i * 100, currency: 'inr' },
      expand: ['default_price']
    })
    self.price_id = prod["default_price"]["id"] 
    self.prod_id = prod["id"]
    self.save
  end
end
