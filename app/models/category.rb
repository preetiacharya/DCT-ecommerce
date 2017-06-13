class Category < ActiveRecord::Base

  has_many :products
  has_many :sub_categories

  validates_presence_of :name
  validates_uniqueness_of :name

  #validates :name, presence: true, uniqueness: true (This method is also used to validate.)

  def formatted_name
    "#{self.id} - #{self.name}"
    #This is used to bring value on each page.
  end
end
