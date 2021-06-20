class Reader < ActiveRecord::Base
  has_many :subscriptions
  has_many :magazines, through: :subscriptions

  def subscribe(magazine, price)
    Subscription.create(magazine: magazine, price: price, reader: self)
  end

  def total_subscription_price
    self.subscriptions.pluck(:price).sum
  end

  def cancel_subscription(magazine)
  mag = self.subscriptions.find_by(magazine: magazine)
  if mag.nil?
    "You are not subscribed to that magazine."
  else mag.destroy
  end
  end
end