class Order < ActiveRecord::Base
  validates_presence_of :user_id, :order_date, :order_number
  validates_numericality_of :user_id, greater_than:0

  before_validation :set_order_details

  belongs_to :user

  belongs_to :address

  has_many :order_products

  after_create :generate_order_products

  after_create :send_confirmation

  def generate_order_products
    #CartLineItem.where('user_id - ?', self.user_id)
    cart_line_items = self.user.cart_line_items
    sum = 0
    cart_line_items.each do |cart_line_item|
      order_product = OrderProduct.new
      order_product.order_id = self.id
      order_product.product_id = cart_line_item.product_id
      order_product.quantity = cart_line_item.quantity
      order_product.price = cart_line_item.product.price
      order_product.total = order_product.price * order_product.quantity
      order_product.save
      sum += order_product.total
    end
    #removes products from cart line items
    CartLineItem.delete(self.user.cart_line_items.pluck(:id))
    self.update_attributes(total_amoun: sum)
  end

  def set_order_details
    self.order_number = "DCT#{Random.rand(1000)}"
    self.order_date = Date.today
    #self.total_amoun = 1 #todo
  end

  def send_confirmation
    Notification.order_confirmation(self).deliver!
  end

end
