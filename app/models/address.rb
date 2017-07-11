class Address < ActiveRecord::Base

  validates_presence_of :street, :city, :pin, :title
  validates_numericality_of :user_id, :pin, greater_than: 0

  has_many :orders
  belongs_to :user

  def full_address

    "#{self.street}, #{self.city} - #{self.pin}"
  end

end
