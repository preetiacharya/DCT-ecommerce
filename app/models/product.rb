class Product < ActiveRecord::Base

  has_many :reviews
  has_many :cart_line_items

  belongs_to :category
  belongs_to :sub_category

  #inbuilt validations
  validates_presence_of :name, :price, :category_id, :description, :stock, :sub_category_id
  validates_numericality_of :price, greater_than: 1
  validates_numericality_of :stock, greater_than_or_equal_to: 0
  validates_numericality_of :category_id, :sub_category_id, greater_than: 0
  validates_length_of :description, minimum: 10 #maximum: 100
  validates_length_of :name, minimum: 4
  validate :check_for_cod_based_on_price #invoke custom method
  validate :check_for_category_of_the_product
  validate :check_for_multiple_categories_for_cod

  #custom validations
  def check_for_cod_based_on_price
    if !self.price.nil?
      if self.price > 50000 && self.cod_eligibility
        self.errors.add(:cod_eligibility, "not available for products greater than 50000")
      end
    end
  end

  def check_for_category_of_the_product
    if !self.category_id.nil?
      if self.category_id == 1
        self.errors.add(:cod_eligibility, "Electronics- Not available")
      end
    end
  end

  def check_for_multiple_categories_for_cod
    if !self.category_id.nil?
      if (self.category_id == 1 || self.category_id == 4) && self.cod_eligibility
        self.errors.add(:cod_eligibility, "Not available for this category")
      end
    end
  end
end
